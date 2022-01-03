package fr.eilco.viewlayer;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Categorie;
import fr.eilco.dao.DaoEcommerce;

/**
 * Servlet implementation class ServletCategorie
 */
@WebServlet("/Categorie")
public class ServletCategorie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletCategorie() {
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
		session.removeAttribute("result");
		DaoEcommerce dao = new DaoEcommerce();
		List<Categorie> categories = dao.getAllCategories();
		// TODO affichage des categories sur categorie.jsp
		request.setAttribute("ListCategories", categories);
		request.setAttribute("nombreCategorie", categories.size());
		request.getRequestDispatcher("categories.jsp").forward(request,response);
	}
	

}
