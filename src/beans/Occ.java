package beans;

import java.sql.Date;
import java.sql.Time;

public class Occ {

	private int id;
	private Date date;
	private String code;
	private Time heureDebut;
	private Time heureFin;
	private String matricule;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Time getHeureDebut() {
		return heureDebut;
	}
	public void setHeureDebut(Time heureDebut) {
		this.heureDebut = heureDebut;
	}
	public Time getHeureFin() {
		return heureFin;
	}
	public void setHeureFin(Time heureFin) {
		this.heureFin = heureFin;
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	
	public Occ(int id, Date date, String code, Time heureDebut, Time heureFin, String matricule, String statut) {
		super();
		this.id = id;
		this.date = date;
		this.code = code;
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
		this.matricule = matricule;
		this.statut = statut;
	}
	
	public Occ(Date date, String code, Time heureDebut, Time heureFin, String matricule, String statut) {
		this.date = date;
		this.code = code;
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
		this.matricule = matricule;
		this.statut = statut;
	}
	
	@Override
	public String toString() {
		return "Occ [id=" + id + ", date=" + date + ", code=" + code + ", heureDebut=" + heureDebut + ", heureFin="
				+ heureFin + ", matricule=" + matricule + ", statut=" + statut + "]";
	}

}
