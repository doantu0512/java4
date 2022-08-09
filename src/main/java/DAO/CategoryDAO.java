package DAO;

import JPAUtils.Jpautil;
import entity.Category;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class CategoryDAO {
    private EntityManager em;

    public CategoryDAO() {
        this.em = Jpautil.getEntityManager();
    }

    public Category create(Category entity) throws Exception {
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

    public Category update(Category entity) throws Exception {
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

    public List<Category> all() {
        String jpql = "SELECT obj from Category obj where obj.status=true";
        TypedQuery<Category> query = this.em.createQuery(jpql, Category.class);
        List<Category> list = query.getResultList();
        return list;
    }

    public Category findByID(int id) {
        Category entity = this.em.find(Category.class, id);
        return entity;
    }
}
