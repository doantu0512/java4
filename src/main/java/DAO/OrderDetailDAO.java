package DAO;

import JPAUtils.Jpautil;
import entity.Order;
import entity.Orderdetail;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class OrderDetailDAO {
    private EntityManager em;

    public OrderDetailDAO() {
        this.em = Jpautil.getEntityManager();
    }
    public Orderdetail create(Orderdetail entity) throws Exception {
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
    public List<Orderdetail> findByIDOrder(int id){
        String jpql="SELECT obj from Orderdetail obj where obj.order.id= :id";
        TypedQuery<Orderdetail> query =this.em.createQuery(jpql,Orderdetail.class);
        query.setParameter("id",id);
        List<Orderdetail> list=query.getResultList();
        return list;
    }

}
