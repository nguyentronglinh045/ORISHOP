package vn.orishop.configs;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    // EntityManagerFactory là một đối tượng nặng, chỉ nên khởi tạo một lần duy nhất (Singleton)
    private static EntityManagerFactory factory;

    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            // "myPersistenceUnit" phải khớp chính xác 100% với tên trong thẻ <persistence-unit name="..."> ở file persistence.xml
            factory = Persistence.createEntityManagerFactory("myPersistenceUnit");
        }
        return factory.createEntityManager();
    }

    // Hàm này gọi khi ứng dụng dừng lại (ví dụ trong phương thức destroy của Filter hoặc Servlet)
    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}