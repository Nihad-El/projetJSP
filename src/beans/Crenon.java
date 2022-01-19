package beans;

import java.sql.Time;

public class Crenon {

	private int id;
	private Time heureDebut;
	private Time heureFin;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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

	public Crenon(Time heureDebut, Time heureFin) {
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
	}
	
	public Crenon(int id,Time heureDebut, Time heureFin) {
		this.id=id;
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
	}



}
