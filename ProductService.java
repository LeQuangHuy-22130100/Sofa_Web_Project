package vn.edu.hcmuaf.fit.project.Service;
import vn.edu.hcmuaf.fit.project.DAO.dao.productDAO;
import vn.edu.hcmuaf.fit.project.DAO.model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductService {
    productDAO productDao= new productDAO();

    public List<Product> getAll() throws SQLException, ClassNotFoundException {
        return productDao.getAll();
    }

    public Product getProductDetail(String id) throws SQLException, ClassNotFoundException {
        return productDao.getByID(id);
    }

    public List<Product> getProductbyCateID(String cateID) throws SQLException, ClassNotFoundException {
        return productDao.getListProductByCategoryID(cateID);
    }

    public List<Product> listSizeRange(String SizeRange) throws SQLException, ClassNotFoundException {
        return productDao.getListProductBySize(SizeRange);
    }

    public List<Product> getProductByPriceRange(String min, String max) throws SQLException, ClassNotFoundException{
        return productDao.getListProductByPriceRange(min, max);
    }
    public List<Product> findAll() {
        return productDAO.findALl();
    }


    public Product findById(int id) {
        return productDAO.findById(id).stream().findFirst().get();
    }



    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        ProductService productService = new ProductService();
//        String sizeRange = "Dưới 2,5m";
////        List<Product> list = productService.getProductbyCateID("1");
//        List<Product> list = productService.listSizeRange(sizeRange);
//        System.out.println(list);
//        System.out.println();
//
        ProductService productService = new ProductService();
        String min = "12000";
        String max = "trở lên";
        List<Product> getProductByPriceRange = productService.getProductByPriceRange(min,max);
        for (Product PriceRangeList : getProductByPriceRange) {
            System.out.println(PriceRangeList);
        }
    }
}
