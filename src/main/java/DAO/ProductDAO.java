package DAO;

import JPAUtils.Jpautil;
import entity.Category;
import entity.Product;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class ProductDAO {
    private EntityManager em;

    public ProductDAO() {
        this.em = Jpautil.getEntityManager();
    }

    public Product create(Product entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.persist(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            this.em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
        return entity;
    }

    public Product update(Product entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.merge(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            this.em.getTransaction().rollback();
            e.printStackTrace();
            throw e;
        }
        return entity;
    }

    public List<Product> all(){
        String jpql="SELECT obj from Product obj where obj.status=1 or obj.status=2 ";
        TypedQuery<Product> query =this.em.createQuery(jpql,Product.class);
        List<Product> list=query.getResultList();
        return list;
    }
    public List<Product> getAll(){
        String jpql="SELECT obj from Product obj where obj.status=1 ";
        TypedQuery<Product> query =this.em.createQuery(jpql,Product.class);
        List<Product> list=query.getResultList();
        return list;
    }
    public Product findByID(int id){
        Product entity=this.em.find(Product.class,id);
        return entity;
    }
    public List<Product> findByName(String name) {
        String jpql = "SELECT obj FROM Product obj " + "WHERE obj.ten like :name and obj.status=1";
        TypedQuery<Product> query = this.em.createQuery(jpql, Product.class);
        query.setParameter("name", "%"+name+"%");
        List<Product> result = query.getResultList();
        return result;
    }

    public List<Product> findByIDCategory(int id){
        String jpql="SELECT obj from Product obj where obj.category.id= :id AND obj.status=1";
        TypedQuery<Product> query =this.em.createQuery(jpql,Product.class);
        query.setParameter("id",id);
        List<Product> list=query.getResultList();
        return list;
    }
}
