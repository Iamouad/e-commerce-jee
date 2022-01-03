package beans;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;


import javax.ejb.Stateless;
import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;


import entities.Categorie;
import entities.Produit;
import entities.User;

/**
 * Session Bean implementation class ManagementBean
 */
@Stateless(name="ManagementJNDI")
public class ManagementBean implements ManagementBeanRemote {
	@PersistenceContext(unitName = "ejbecommerce")
	private EntityManager entityManager;

	public ManagementBean() {
	}

	public boolean authentification(String username, String hashedPassword) {

		try {
			System.out.println("fetching admin" + username + " " + hashedPassword); 
	          List<User> users = getAllUser();
	          System.out.println("User Names :");  
	          for(User u:users) {  
	        	  System.out.println(u.getUsername() + " " + u.getPassword());
	             if(u.getUsername().equals(username) && u.getPassword().equals(hashedPassword)) {
	            	 System.out.println("Login matched");
	            	 return true;
	             }   
	          }  

			System.out.println("User not found");
			return false;
		} catch (Exception noresult) {
			return false;
		}

	}

	public void addUser(String username, String hashedPassword) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(hashedPassword);
		entityManager.persist(user);
	}
	public void updateUser(User u ) {
		if(!u.equals(null)) {
			entityManager.merge(u);
		}
	}
	@Override
	public List<User> getAllUser() {
	
		return entityManager.createNamedQuery("User.findAll",User.class).getResultList();
	}

	public void addProduit(Produit p) {
		if(!p.equals(null)) {
			p.setDernierMaj(Timestamp.valueOf(LocalDateTime.now()));
			entityManager.persist(p);

		}
	}
	public void updateProduit(Produit p) {
		if(!p.equals(null))
			entityManager.merge(p);
	}
	@Override
	public List<Produit> getAllProduit() {
		return entityManager.createNamedQuery("Produit.findAll",Produit.class).getResultList();
	}

	
	public void addCategorie(Categorie c) {
		if(!c.equals(null))
			entityManager.persist(c);
	}
	
	public void updateCategorie(Categorie c) {
		if(!c.equals(null))
			entityManager.merge(c);
	}
	
	@Override
	public List<Categorie> getAllCategorie() {
		return entityManager.createNamedQuery("Categorie.findAll",Categorie.class).getResultList();
	}

	@Override
	public Produit getProduitById(int id) {
		return entityManager.find(Produit.class, id);
	}

	@Override
	public void deleteProduit(Produit p) {
		entityManager.remove(entityManager.find(Produit.class, p.getId()));
		
	}

	@Override
	public Categorie getCategorieById(int id) {
		// TODO Auto-generated method stub
		return entityManager.find(Categorie.class, id);
	}


	@Override
	public void deleteCategorie(Categorie c) {
		entityManager.remove(entityManager.find(Categorie.class, c.getId()));
		
	}
	

}
