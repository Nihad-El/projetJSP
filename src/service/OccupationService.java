package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import beans.Client;
import beans.Occ;
import beans.Occupation;
import beans.Salle;
import connexion.Connexion;
import dao.IDao;

public class OccupationService implements IDao<Occupation> {

	SalleService ss;
	   @Override
	    public boolean create(Occupation o) {
	        String sql = "insert into occupation values (null,?, ?, ?,?,?)";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setDate(1,new Date(o.getDate().getTime()));
	            ps.setInt(2, o.getCode());
	            ps.setInt(3, o.getHeureDebut());
	            ps.setInt(4, o.getMatricule());
	            ps.setString(5, o.getStatut());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("create occupation : erreur sql : " + e.getMessage());

	        }
	        return false;
	    }

	    @Override
	    public boolean delete(Occupation o) {
	        String sql = "delete from uccupation where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("delete : erreur sql : " + e.getMessage());

	        }
	        return false;
	    }

	    @Override
	    public boolean update(Occupation o) {

	        String sql = "update occupation set statut  = ? where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setString(1, o.getStatut());
	            ps.setInt(2, o.getId());
	            if (ps.executeUpdate() == 1) {
	                return true;
	            }
	        } catch (SQLException e) {
	            System.out.println("update : erreur sql : " + e.getMessage());

	        }
	        return false;
	    }

	    @Override
	    public Occupation findById(int id) {
	    	//Salle m = null;
	        String sql = "select * from occupation where id  = ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);
	            ps.setInt(1, id);
	            ResultSet rs = ps.executeQuery();
	            if (rs.next()) {
	                return new Occupation(rs.getInt("id"),rs.getDate("date"),rs.getInt("idsalle"),rs.getInt("idcrenom"),rs.getInt("idclient"),rs.getString("statut"));
	            }

	        } catch (SQLException e) {
	            System.out.println("findById " + e.getMessage());
	        }
	        return null;
	    }

	    @Override
	    public List<Occupation> findAll() {
	        List<Occupation> machines = new ArrayList<Occupation>();

	       /* String sql = "SELECT o.id,o.date,s.code,c.heureDebut,c.heureFin,cl.matricule,o.statut FROM occupation o INNER join salle s on o.idsalle=s.id INNER JOIN crenom c on c.id=o.idcrenom INNER JOIN clientt cl on cl.id=o.idclient";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new Occupation(rs.getInt("id"), rs.getDate("date"),rs.getString("code"),rs.getTime("heureDebut"),rs.getTime("heureFin"),rs.getString("matricule"),rs.getString("statut")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }*/
	        return machines;
	    }
	    
	    public List<Salle> findMachineByReference(String ref) {
	        List<Salle> machines = new ArrayList<Salle>();

	        String sql = "select * from clientt where code =  ?";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ps.setString(1, ref);
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new Salle(rs.getInt("id"), rs.getString("code"), rs.getInt("capacite"),
	                        rs.getString("type")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAll " + e.getMessage());
	        }
	        return machines;
	    }
	    
	    public List<String> findReference() {
	        List<String> references = new ArrayList<String>();
	        String sql = "select distinct(reference) as ref from salle";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                references.add(rs.getString("ref"));
	            }
	        } catch (SQLException e) {
	            System.out.println("findReference " + e.getMessage());
	        }
	        return references;
	    }
	    
	 
	    public List<Occ> findAlll() {
	        List<Occ> machines = new ArrayList<Occ>();

	        String sql = "SELECT o.id,o.date,s.code,c.heureDebut,c.heureFin,cl.prenom,o.statut FROM occupation o INNER join salle s on o.idsalle=s.id INNER JOIN crenom c on c.id=o.idcrenom INNER JOIN client cl on cl.id=o.idclient";
	        try {
	            PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);;
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                machines.add(new Occ(rs.getInt("id"), rs.getDate("date"),rs.getString("code"),rs.getTime("heureDebut"),rs.getTime("heureFin"),rs.getString("prenom"),rs.getString("statut")));
	            }

	        } catch (SQLException e) {
	            System.out.println("findAlll " + e.getMessage());
	        }
	        return machines;
	    }
	    
	    public Map<String, Integer> mostReserved() {
			Map<String, Integer> map = new LinkedHashMap<>();
			ss = new SalleService();
			String sql = "SELECT  idsalle ,count(*) " + "FROM occupation  " + "GROUP BY  idsalle "
					+ "ORDER BY count(*) DESC";

			try {
				PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					map.put(ss.findById(rs.getInt("idsalle")).getCode(), rs.getInt("count(*)"));
				}

			} catch (SQLException e) {
				System.out.println("findAll " + e.getMessage());
			}

			return map;
		}

		public Map<LocalDate, Integer> monthly() {
			Map<LocalDate, Integer> map = new LinkedHashMap<>();

			String sql = "SELECT    YEAR (date),    MONTH(date),    COUNT(*)  FROM    occupation  WHERE    ( date BETWEEN DATE_SUB( CURRENT_DATE() , INTERVAL 1 YEAR) AND CURRENT_DATE() )  GROUP BY    YEAR (date),    MONTH(date)  ORDER BY    YEAR (date),    MONTH(date) DESC ";

			try {
				PreparedStatement ps = Connexion.getInstane().getConnection().prepareStatement(sql);

				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					map.put( LocalDate.of(rs.getInt(1), rs.getInt(2) , 0) , rs.getInt("count(*)"));
				}

			} catch (SQLException e) {
				System.out.println("findAll " + e.getMessage());
			}

			return map;
		}

	}


