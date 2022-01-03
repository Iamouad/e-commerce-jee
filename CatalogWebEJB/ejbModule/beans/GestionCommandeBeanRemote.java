package beans;

import java.math.BigDecimal;
import java.util.List;

import javax.ejb.Remote;

import entities.ProduitCommande;
import entities.Client;
@Remote
public interface GestionCommandeBeanRemote {
	//public ProduitCommande createCommande();
	public void validerCommande(Client customer,List<ProduitCommande> panier, BigDecimal total);
}
