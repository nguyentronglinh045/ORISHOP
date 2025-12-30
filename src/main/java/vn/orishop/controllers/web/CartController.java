package vn.orishop.controllers.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import vn.orishop.entity.Product;
import vn.orishop.models.CartItem;
import vn.orishop.services.IProductService;
import vn.orishop.services.impl.ProductServiceImpl;

@WebServlet(urlPatterns = {"/cart", "/cart/add", "/cart/remove", "/cart/update", "/cart/checkout"})
public class CartController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Gọi Service
    IProductService productService = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.contains("add")) {
            addToCart(req, resp);
        } else if (url.contains("remove")) {
            removeFromCart(req, resp);
        } else if (url.contains("checkout")) {
            req.getRequestDispatcher("/views/web/checkout.jsp").forward(req, resp);
        } else {
            // Mặc định là trang xem giỏ hàng (/cart)
            req.getRequestDispatcher("/views/web/cart.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String url = req.getRequestURI();

        if (url.contains("update")) {
            updateCart(req, resp);
        }
    }

    protected void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Lấy session
        HttpSession session = req.getSession();

        // Lấy id sản phẩm từ url
        String pId = req.getParameter("pid");
        int productId = Integer.parseInt(pId);

        // Lấy sản phẩm từ CSDL
        Product product = productService.findById(productId);

        if (product != null) {
            // Lấy giỏ hàng từ session (Giả sử lưu dưới dạng Map<ProductId, CartItem>)
            Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }

            // Kiểm tra sản phẩm đã có trong giỏ chưa
            if (cart.containsKey(productId)) {
                // Nếu có rồi thì tăng số lượng
                CartItem item = cart.get(productId);
                item.setQuantity(item.getQuantity() + 1);
            } else {
                // Nếu chưa có thì tạo mới CartItem
                CartItem item = new CartItem();
                item.setProductId(product.getProductId());
                item.setProductName(product.getProductName());
                item.setImage(product.getImage());
                item.setProduct(
                        product); // Lưu giữ object product gốc để hiển thị thông tin phụ (như giá
                // gốc)
                item.setQuantity(1);

                // QUAN TRỌNG: Sử dụng giá sau giảm để tính tiền
                item.setUnitPrice(product.getDiscountPrice());

                cart.put(productId, item);
            }

            // Cập nhật lại session
            session.setAttribute("cart", cart);
        }

        // Quay lại trang trước đó hoặc trang giỏ hàng
        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    protected void removeFromCart(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        HttpSession session = req.getSession();
        String pId = req.getParameter("pid");
        int productId = Integer.parseInt(pId);

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(productId)) {
            cart.remove(productId);
            session.setAttribute("cart", cart);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    protected void updateCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();

        // Lấy id và số lượng mới từ form
        String pId = req.getParameter("pid");
        String quantityStr = req.getParameter("quantity");

        int productId = Integer.parseInt(pId);
        int quantity = Integer.parseInt(quantityStr);

        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");
        if (cart != null && cart.containsKey(productId)) {
            CartItem item = cart.get(productId);
            if (quantity > 0) {
                item.setQuantity(quantity);
            } else {
                // Nếu số lượng <= 0 thì xóa luôn
                cart.remove(productId);
            }
            session.setAttribute("cart", cart);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
