package DAO;

import JPAUtils.Jpautil;
import entity.Order;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class OrderDAO {
    private EntityManager em;

    public OrderDAO() {
        this.em = Jpautil.getEntityManager();
    }
    public Order create(Order entity) throws Exception {
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

    public Order update(Order entity) throws Exception {
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
    public List<Order> all(){
        String jpql="SELECT obj from Order obj";
        TypedQuery<Order> query =this.em.createQuery(jpql,Order.class);
        List<Order> list=query.getResultList();
        return list;
    }
    public Order findByID(int id){
        Order entity=this.em.find(Order.class,id);
        return entity;
    }
    public List<Order> findByIDUser(int id){
        String jpql="SELECT obj from Order obj where obj.userDatHang.id= :id";
        TypedQuery<Order> query =this.em.createQuery(jpql,Order.class);
        query.setParameter("id",id);
        List<Order> list=query.getResultList();
        return list;
    }

}
