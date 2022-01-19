package IDao;

import java.util.List;

/**
 *
 * @author younse
 */
public interface IDao<T> {

    boolean create(T o);

    boolean delete(T o);

    boolean update(T o);

    T getById(int id);

    List<T> getAll();

}
