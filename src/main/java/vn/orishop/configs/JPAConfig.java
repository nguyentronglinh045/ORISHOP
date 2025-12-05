package vn.orishop.configs;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;


public class JPAConfig {
    
    // EntityManagerFactory là một đối tượng nặng, chỉ nên khởi tạo một lần duy nhất (Singleton)
    private static EntityManagerFactory factory;
    private static Properties dbProperties;
    
    // Load properties từ file database.properties khi class được load
    static {
        dbProperties = new Properties();
        try (InputStream input = JPAConfig.class.getClassLoader()
                .getResourceAsStream("database.properties")) {
            if (input != null) {
                dbProperties.load(input);
                System.out.println("✅ Loaded database.properties successfully!");
            } else {
                System.err.println("⚠️ database.properties not found! Using default values from persistence.xml");
            }
        } catch (IOException e) {
            System.err.println("❌ Error loading database.properties: " + e.getMessage());
        }
    }
    
    /**
     * Lấy giá trị từ properties, có giá trị mặc định nếu không tìm thấy
     */
    public static String getProperty(String key, String defaultValue) {
        return dbProperties.getProperty(key, defaultValue);
    }
    
    /**
     * Chuẩn hóa auth mode
     * Dự án chỉ hỗ trợ 2 chế độ:
     *   - "windows": Windows Authentication
     *   - "sql": SQL Server Authentication
     * @return "windows" hoặc "sql"
     */
    private static String normalizeAuthMode(String authMode) {
        if (authMode == null || authMode.trim().isEmpty()) {
            return "windows"; // Mặc định
        }
        
        String mode = authMode.trim().toLowerCase();
        
        // Windows Authentication
        if (mode.equals("windows")) {
            return "windows";
        }
        
        // SQL Server Authentication
        if (mode.equals("sql")) {
            return "sql";
        }
        
        // Nếu không nhận diện được, cảnh báo và dùng mặc định
        System.err.println("⚠️ Unknown auth mode: '" + authMode + "'");
        System.err.println("   Supported modes: 'windows' hoặc 'sql'");
        System.err.println("   Using 'windows' as default.");
        return "windows";
    }
    
    /**
     * Xây dựng JDBC URL từ các properties
     */
    private static String buildJdbcUrl() {
        String server = getProperty("db.server", "localhost");
        String port = getProperty("db.port", "1433");
        String dbName = getProperty("db.name", "ORISHOP");
        String authMode = normalizeAuthMode(getProperty("db.auth.mode", "windows"));
        
        StringBuilder url = new StringBuilder();
        url.append("jdbc:sqlserver://")
           .append(server).append(":").append(port)
           .append(";databaseName=").append(dbName)
           .append(";encrypt=true;trustServerCertificate=true");
        
        // Nếu dùng Windows Authentication
        if ("windows".equals(authMode)) {
            url.append(";integratedSecurity=true");
        }
        
        return url.toString();
    }
    
    /**
     * Tạo Map chứa các properties để override persistence.xml
     */
    private static Map<String, String> buildPersistenceProperties() {
        Map<String, String> props = new HashMap<>();
        
        // JDBC Config
        props.put("jakarta.persistence.jdbc.driver", 
                  getProperty("db.driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver"));
        props.put("jakarta.persistence.jdbc.url", buildJdbcUrl());
        
        // SQL Server Authentication (nếu dùng mode sql/sqlserver/server/sa/...)
        String authMode = normalizeAuthMode(getProperty("db.auth.mode", "windows"));
        if ("sql".equals(authMode)) {
            String username = getProperty("db.username", "");
            String password = getProperty("db.password", "");
            
            if (username.isEmpty()) {
                System.err.println("⚠️ WARNING: SQL Authentication mode requires db.username!");
            } else {
                props.put("jakarta.persistence.jdbc.user", username);
                props.put("jakarta.persistence.jdbc.password", password != null ? password : "");
                System.out.println("🔐 Using SQL Server Authentication with user: " + username);
            }
        } else {
            System.out.println("🔐 Using Windows Authentication (Integrated Security)");
        }
        
        // Hibernate Config
        props.put("hibernate.dialect", 
                  getProperty("hibernate.dialect", "org.hibernate.dialect.SQLServer2012Dialect"));
        props.put("hibernate.hbm2ddl.auto", 
                  getProperty("hibernate.hbm2ddl.auto", "update"));
        props.put("hibernate.show_sql", 
                  getProperty("hibernate.show_sql", "true"));
        props.put("hibernate.format_sql", 
                  getProperty("hibernate.format_sql", "true"));
        props.put("hibernate.connection.charSet", "UTF-8");
        props.put("hibernate.use_sql_comments", "true");
        
        return props;
    }

    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            // Truyền properties để override các giá trị trong persistence.xml
            Map<String, String> props = buildPersistenceProperties();
            
            System.out.println("🔗 Connecting to: " + props.get("jakarta.persistence.jdbc.url"));
            
            factory = Persistence.createEntityManagerFactory("myPersistenceUnit", props);
        }
        return factory.createEntityManager();
    }

    // Hàm này gọi khi ứng dụng dừng lại (ví dụ trong phương thức destroy của Filter hoặc Servlet)
    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
            System.out.println("🔌 Database connection closed.");
        }
    }
    
    /**
     * Kiểm tra kết nối database
     */
    public static boolean testConnection() {
        try {
            EntityManager em = getEntityManager();
            em.close();
            System.out.println("✅ Database connection test: SUCCESS");
            return true;
        } catch (Exception e) {
            System.err.println("❌ Database connection test: FAILED - " + e.getMessage());
            return false;
        }
    }
}