package fr.eilco.viewlayer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.AccessCatalogBeanRemote;
import beans.GestionCommandeBeanRemote;
import entities.Client;
import entities.CommandeClient;
import entities.Produit;
import entities.ProduitCommande;
import fr.eilco.dao.DaoEcommerce;

/**
 * Servlet implementation class ServletValiderCommande
 */
@WebServlet("/ValiderCommande")
public class ServletValiderCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletValiderCommande() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		Client customer = (Client)session.getAttribute("customer");
		BigDecimal total = new BigDecimal(session.getAttribute("total").toString());
		List<ProduitCommande> panier = (List<ProduitCommande>) session.getAttribute("panier");
		DaoEcommerce dao = new DaoEcommerce();
		boolean result = dao.placeCustomerOrder(customer,panier,total);
		if(result) {
			//session.invalidate();
			session.setAttribute("display", false);
			session.setAttribute("success", true);
			session.setAttribute("size", 0);
			
			session.setAttribute("result", "<a href='/CatalogWeb'>Revenir à la page d'accueil</a>");
			session.removeAttribute("panier");
			response.sendRedirect("recapitulatif.jsp");
			
		}else {
			//session.invalidate();
			session.setAttribute("success", false);
			session.setAttribute("result", "Probleme d'enregistrement de votre commande reessayer <a href='/CatalogWeb'>Revenir à la page d'accueil</a>");
			response.sendRedirect("recapitulatif.jsp");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
