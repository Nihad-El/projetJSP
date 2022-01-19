package ma.projet.service;

import java.util.List;
import ma.projet.util.HibernateUtil;
import ma.projet.entity.Client;
import org.hibernate.Session;

/**
 *
 * @author YOUNSE
 */
public class ServiceClient implements IDao.IDao<Client> {

    @Override
    public boolean create(Client o) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(o);
        session.getTransaction().commit();
        return true;
    }

    @Override
    public boolean delete(Client o) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(o);
        session.getTransaction().commit();
        return true;
    }

    @Override
    public boolean update(Client o) {
          Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(o);
        session.getTransaction().commit();
        return true;
    }

    @Override
    public Client getById(int id) {
        Client client = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        client = (Client) session.get(Client.class, id);
        session.getTransaction().commit();
        return client;
    }

    @Override
    public List<Client> getAll() {
        List<Client> clients = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        clients = session.createQuery("from Client").list();
        session.getTransaction().commit();
        return clients;
    }

    public Client getByEmail(String email) {
        Client c = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        c = (Client) session.createQuery("from Client where email = ?0").setParameter(0, email).uniqueResult();
        System.out.println("------------------ requete"+c);
        session.getTransaction().commit();
        return c;
    }

}
