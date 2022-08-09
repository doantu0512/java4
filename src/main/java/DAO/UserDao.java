package DAO;

import JPAUtils.Jpautil;
import entity.User;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.transaction.Transaction;
import java.util.List;

public class UserDao {
    private EntityManager em;

    public UserDao() {
        this.em = Jpautil.getEntityManager();
    }

    public User create(User entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.persist(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            this.em.getTransaction().rollback();
            throw e;
        }
        return entity;
    }

    public User update(User entity) throws Exception {
        try {
            this.em.getTransaction().begin();
            this.em.merge(entity);
            this.em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            this.em.getTransaction().rollback();
            throw e;
        }
        return entity;
    }


    public List<User> all() {
        String jpql = "SELECT obj FROM User obj where obj.status=1 OR obj.status=2";
        TypedQuery<User> query = this.em.createQuery(jpql, User.class);
        List<User> ds = query.getResultList();
        return ds;
    }

    public User findByID(int id) {
        User entity = this.em.find(User.class, id);
        return entity;
    }

    public User findByEmail(String email) {
        String jpql = "SELECT obj FROM User obj " + "WHERE obj.email = :email";
        TypedQuery<User> query = this.em.createQuery(jpql, User.class);
        query.setParameter("email", email);
        List<User> result = query.getResultList();
        if (result.isEmpty()){
            return null;
        }
        return result.get(0);
    }

}
