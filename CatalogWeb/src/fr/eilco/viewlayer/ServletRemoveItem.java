package fr.eilco.viewlayer;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.ProduitCommande;

/**
 * Servlet implementation class ServletRemoveItem
 */
@WebServlet("/RemoveItem")
public class ServletRemoveItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRemoveItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int idProduit = Integer.parseInt(request.getParameter("idProduit"));
		System.out.println("Removing item " + idProduit );
		int quantite = Integer.parseInt(request.getParameter("quantite"));
		HttpSession session = request.getSession(true);
		List<ProduitCommande> panier;
		float total=0;
		BigDecimal prix = null;
		if (session.getAttribute("panier") instanceof List) {
			panier = (List<ProduitCommande>) session.getAttribute("panier");
			int counter = 0;
			int indexRemvedItem = 0;

			for(ProduitCommande ligneproduit : panier) {
				total+= ligneproduit.getProduit().getPrix().multiply(new BigDecimal(ligneproduit.getQuantite())).floatValue();

				if(ligneproduit.getProduit().getId()==idProduit) {
					indexRemvedItem = counter;
					prix = ligneproduit.getProduit().getPrix();				
				}
				counter++;

			}
			panier.remove(indexRemvedItem);
			total-= prix.multiply(new BigDecimal(quantite)).floatValue();

			System.out.println("New total" + total);
			if(total == (float) 0) {
				System.out.println("removing panier");
				session.removeAttribute("panier");
				session.setAttribute("display", false);

			}
			else {
				session.setAttribute("panier", panier);
			}
			
			session.setAttribute("total", total);
			response.getWriter().printf("%,.2f", total);
		} else {
			response.sendError(404);
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
