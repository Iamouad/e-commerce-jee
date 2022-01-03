package beans;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.Stateless;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import entities.Client;
import entities.CommandeClient;
import entities.ProduitCommande;
import entities.User;

/**
 * Session Bean implementation class GestionCommandeBean
 */
@Stateless(name="GestionCommandeJNDI")
public class GestionCommandeBean implements GestionCommandeBeanRemote {
	//@PersistenceContext(unitName="ejbecommerce")
	private EntityManager entityManager;

	@Override
	public void validerCommande(Client customer, List<ProduitCommande> panier,BigDecimal total) {
		
		customer = persistCustomer(customer);
		CommandeClient ligneCommande = new CommandeClient();
		ligneCommande.setClient(customer);
		ligneCommande.setMontant(total);
		ligneCommande.setNoConfirmation(customer.getId());
		ligneCommande = persistCommandeClient(ligneCommande);
		for(ProduitCommande pc : panier) {
			pc.setCommandeClientId(ligneCommande.getId());
			entityManager.persist(pc);
			//entityManager.flush();
			System.out.println("produit commande id = "+pc.getCommandeClientId());
		}
	}
	public Client persistCustomer(Client customer) {
		
		try {
			System.out.println("Creating new client");
			EntityManagerFactory emf=Persistence.createEntityManagerFactory("ejbecommerce"); 
			entityManager = emf.createEntityManager();
			List<Client> clients = (List<Client>) entityManager.createNamedQuery("Client.findAll",Client.class).getResultList();
			for(Client c : clients) {
				System.out.println(c.getEmail());
				if(c.getEmail().equals(customer.getEmail())){
					
					System.out.println("Customer account already exists");
					customer.setId(c.getId());
					return customer;
				}
			}
			entityManager.getTransaction().begin();
			entityManager.persist(customer);
			System.out.println("New customer added id = "+customer.getId());
			entityManager.getTransaction().commit();
			emf.close();
			entityManager.close();
		   
		} catch(Exception e) {
			e.printStackTrace();
		} 
		return customer;
		
	}
	public CommandeClient persistCommandeClient(CommandeClient ligneCommande) {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("ejbecommerce"); 
		entityManager = emf.createEntityManager();
		entityManager.getTransaction().begin();
		entityManager.persist(ligneCommande);
		//entityManager.flush();
		System.out.println("ligne commande id = "+ligneCommande.getId());
		entityManager.getTransaction().commit();

		return ligneCommande;
	}


}
