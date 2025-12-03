package vn.orishop.utils;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

public class UploadUtils {

  
    public static String processUpload(String fieldName, HttpServletRequest req, String storeFolder, String storedFilename)
            throws IOException, ServletException {
        
        // Lấy phần dữ liệu file từ request theo tên field
        Part filePart = req.getPart(fieldName);

        // Kiểm tra xem người dùng có chọn file hay không
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        // Nếu storeFolder là null, sử dụng thư mục mặc định trong Constant
        if (storeFolder == null) {
            storeFolder = Constant.DIR;
        }

        // Chuyển đổi đường dẫn tương đối (webapp) sang đường dẫn tuyệt đối trên ổ cứng server
        String uploadPath = req.getServletContext().getRealPath(storeFolder);

        // Tạo đối tượng File để kiểm tra thư mục
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            // Nếu thư mục chưa tồn tại thì tạo mới (bao gồm cả các thư mục cha nếu cần)
            uploadDir.mkdirs();
        }

        // Lấy tên file gốc mà người dùng upload (ví dụ: my-photo.jpg)
        // getSubmittedFileName() là phương thức của Servlet 3.1+
        String originalFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        // Lấy phần mở rộng của file (ví dụ: jpg, png) dùng thư viện Apache Commons IO
        // FilenameUtils.getExtension giúp xử lý an toàn các ký tự đặc biệt
        String fileExtension = FilenameUtils.getExtension(originalFileName);

        // Tạo tên file cuối cùng để lưu: tên_muốn_lưu + . + đuôi_file_gốc
        String finalFileName = storedFilename + "." + fileExtension;

        // Ghi file xuống ổ cứng
        // Lưu ý: phương thức write của Part yêu cầu đường dẫn tuyệt đối
        filePart.write(uploadPath + File.separator + finalFileName);

        // Trả về tên file để lưu vào Database
        return finalFileName;
    }
}