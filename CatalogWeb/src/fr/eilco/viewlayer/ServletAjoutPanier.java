package fr.eilco.viewlayer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
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
import entities.Produit;
import entities.ProduitCommande;
import fr.eilco.dao.DaoEcommerce;

/**
 * Servlet implementation class ServletAjoutPanier
 */
@WebServlet("/AjoutPanier")
public class ServletAjoutPanier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletAjoutPanier() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		List<ProduitCommande> panier;
		float total;
		
		//check if panier existe
		if (session.getAttribute("panier") instanceof List) {
			panier = (List<ProduitCommande>) session.getAttribute("panier");
			total = Float.parseFloat(session.getAttribute("total").toString());
		//create new panier if not
		} else {
			panier = new ArrayList<ProduitCommande>();
			total = 0.f;
			
		}
		
		int idProduit = Integer.parseInt(request.getParameter("idProduit"));
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		
		DaoEcommerce dao = new DaoEcommerce();
		Produit produit = dao.getProduitById(idProduit);
		boolean exist = false;
		
		//check if the product id is valid
		for(ProduitCommande produitCommande : panier) {
			if(produitCommande.getProduit().getId()==produit.getId()) {
				produitCommande.setQuantite(produitCommande.getQuantite()+quantite);
				exist = true;
			}
		}
		
		total +=produit.getPrix().multiply(new BigDecimal(quantite)).floatValue();
		
		if(!exist) {
			ProduitCommande produitCommande = new ProduitCommande();
			produitCommande.setProduit(produit);
			produitCommande.setQuantite(quantite);
			panier.add(produitCommande);
		}
		
		session.removeAttribute("panier");
		session.removeAttribute("total");
		
		session.setAttribute("panier", panier);
		session.setAttribute("total", total);
		session.setAttribute("display", true);
		session.setAttribute("size", panier.size());
		response.sendRedirect("panier.jsp");
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int idProduit = Integer.parseInt(request.getParameter("idProduit"));
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		HttpSession session = request.getSession(true);
		List<ProduitCommande> panier;
		float total=0;
		if (session.getAttribute("panier") instanceof List) {//Panier existe
			panier = (List<ProduitCommande>) session.getAttribute("panier");
			//total = Float.parseFloat(session.getAttribute("total").toString());
			for(ProduitCommande ligneproduit : panier) {
				if(ligneproduit.getProduit().getId()==idProduit) {
					ligneproduit.setQuantite(quantite);
				}
				total+=ligneproduit.getProduit().getPrix().multiply(new BigDecimal(ligneproduit.getQuantite())).floatValue();
			}
			session.setAttribute("panier", panier);
			session.setAttribute("total", total);
			response.getWriter().printf("%,.2f", total);
		} else {
			response.sendError(404);
		}
	}

}
