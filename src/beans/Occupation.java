package beans;

import java.sql.Time;
import java.util.Date;

public class Occupation {

	private int id;
	private Date date;
	private int code;
	private int heureDebut;
	private int matricule;
	private String statut;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getHeureDebut() {
		return heureDebut;
	}
	public void setHeureDebut(int heureDebut) {
		this.heureDebut = heureDebut;
	}
	public int getMatricule() {
		return matricule;
	}
	public void setMatricule(int matricule) {
		this.matricule = matricule;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	public Occupation(int id, Date date, int code, int heureDebut, int matricule, String statut) {
		super();
		this.id = id;
		this.date = date;
		this.code = code;
		this.heureDebut = heureDebut;
		this.matricule = matricule;
		this.statut = statut;
	}
	public Occupation(int code, int heureDebut, int matricule, String statut) {
		this.code = code;
		this.heureDebut = heureDebut;
		this.matricule = matricule;
		this.statut = statut;
	}
	public Occupation(Date date, int code, int heureDebut, int matricule, String statut) {
		this.date = date;
		this.code = code;
		this.heureDebut = heureDebut;
		this.matricule = matricule;
		this.statut = statut;
	}
	public Occupation(int id,String statut) {
		this.id = id;
		this.statut = statut;
	}
	
}
