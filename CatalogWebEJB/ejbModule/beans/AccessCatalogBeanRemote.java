package beans;

import java.util.List;

import javax.ejb.Remote;

import entities.Categorie;
import entities.Produit;

@Remote
public interface AccessCatalogBeanRemote {
	List<Categorie> getListeCategories();
	List<Produit> getListeProduits(int idCategorie);
	Produit getProduitById(int idProduit);
}
