package fr.eilco.dao;

import java.math.BigDecimal;
import java.util.Hashtable;
import java.util.List;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.naming.Context;
import javax.naming.InitialContext;

import beans.AccessCatalogBeanRemote;
import beans.GestionCommandeBeanRemote;
import entities.Categorie;
import entities.Client;
import entities.Produit;
import entities.ProduitCommande;

public class DaoEcommerce {

	private GestionCommandeBeanRemote gestionCommandeBean;

	private AccessCatalogBeanRemote accessCatalogueBean;

	public DaoEcommerce() {
		try {
			final Hashtable jndiProperties = new Hashtable();
			jndiProperties.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			final Context context = new InitialContext(jndiProperties);
			accessCatalogueBean = (AccessCatalogBeanRemote) context.lookup(
					"java:global/CatalogWebEAR/CatalogWebEJB/AccessCatalogJNDI!beans.AccessCatalogBeanRemote");
			gestionCommandeBean = (GestionCommandeBeanRemote) context.lookup(
					"java:global/CatalogWebEAR/CatalogWebEJB/GestionCommandeJNDI!beans.GestionCommandeBeanRemote");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Categorie> getAllCategories() {
		List<Categorie> categories = accessCatalogueBean.getListeCategories();
		return categories;
	}

	public boolean placeCustomerOrder(Client customer, List<ProduitCommande> panier, BigDecimal total) {
		gestionCommandeBean.validerCommande(customer, panier, total);
		return true;
	}

	public Produit getProduitById(int id) {
		Produit produit = accessCatalogueBean.getProduitById(id);
		return produit;
	}

	public List<Produit> getProduitsByCategorie(int idCategorie) {
		List<Produit> produits = accessCatalogueBean.getListeProduits(idCategorie);
		return produits;
	}
}
