package beans;

import java.util.Date;

public class Client {
	private int id;
	private String matricule;
    private String nom;
    private String prenom;
    
    
    public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	
	public Client(int id, String matricule,String nom,String prenom) {
		super();
		this.id = id;
		this.matricule=matricule;
		this.nom = nom;
		this.prenom = prenom;
	}
	
	public Client(String matricule,String nom,String prenom) {
		super();
		this.matricule=matricule;
		this.nom = nom;
		this.prenom = prenom;
	}

	@Override
	public String toString() {
		return "Client [matricule=" + matricule +"]";
	}
	
	
}


