package servlets;

import entity.Person;
import entity.Subject;
import entity.Grade;
import entity.History;
import entity.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.PersonFacade;
import session.SubjectFacade;
import session.GradeFacade;
import session.HistoryFacade;
import session.UserFacade;
import util.EncriptPass;

@WebServlet(name = "LoginController", urlPatterns = {
    "/showLogin",
    "/login",
    "/logout",
    "/newPerson",
    "/addPerson",
})

public class LoginController extends HttpServlet {

    @EJB
    PersonFacade personFacade;
    @EJB
    SubjectFacade subjectFacade;
    @EJB
    GradeFacade gradeFacade;
    @EJB
    HistoryFacade historyFacade;
    @EJB
    UserFacade userFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        EncriptPass ep = new EncriptPass();
        String path = request.getServletPath();
        switch (path) {
            case "/showLogin":
                request.getRequestDispatcher("/showLogin.jsp")
                        .forward(request, response);
                break;
            case "/login":
                String login = request.getParameter("login");
                String password = request.getParameter("password");
                User user = userFacade.findByLogin(login);
                if (user == null) {
                    request.setAttribute("info", "Wrong login or password");
                    request.getRequestDispatcher("/showLogin.jsp")
                            .forward(request, response);
                }
                password = ep.setEncriptPass(password, user.getSalts());
                if (!password.equals(user.getPassword())) {
                    request.setAttribute("info", "Wrong login or password");
                    request.getRequestDispatcher("/showLogin.jsp")
                            .forward(request, response);
                }
                HttpSession session = request.getSession(true);
                session.setAttribute("user", user);
                request.setAttribute("info", "You are logged in as " + login);
                request.getRequestDispatcher("/index.jsp")
                        .forward(request, response);
                break;
            case "/logout":
                session = request.getSession(false);
                if (null != session) {
                    session.invalidate();
                }
                request.setAttribute("info", "You logged out");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                break;
            case "/newPerson":
                request.getRequestDispatcher("/newPerson.jsp").forward(request, response);
                break;
            case "/addPerson":
                String namePerson = request.getParameter("name");
                String status = request.getParameter("status");
                login = request.getParameter("login");
                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");
                if (!(password1 != null && password1.equals(password2))) {
                    request.setAttribute("info",
                            "User add failed (not correct data)");
                    request.getRequestDispatcher("/newPerson.jsp").forward(request, response);
                    break;
                }
                Person person = null;
                try {
                    if (!"".equals(namePerson) && namePerson != null
                            && !"".equals(status) && status != null
                            && !"".equals(login) && login != null
                            && !"".equals(password1) && password1 != null) {
                        person = new Person(null, namePerson);
                        personFacade.create(person);
                        String salts = ep.createSalts();
                        password = ep.setEncriptPass(password1, salts);
                        user = new User(login, status, salts, password, person);
                        try {
                            userFacade.create(user);
                        } catch (Exception e) {
                            personFacade.remove(person);
                            throw new Exception(e);
                        }
                        request.setAttribute("info", "User " + person.getName() + " " + " added."
                        );
                    } else {
                        request.setAttribute("info",
                                "User add failed (not correct data)");
                        request.getRequestDispatcher("/newPerson.jsp").forward(request, response);
                        break;
                    }
                } catch (Exception e) {
                    request.setAttribute("info",
                            "User add failed (not correct data)");
                    request.getRequestDispatcher("/newPerson.jsp").forward(request, response);
                    break;
                }
                request.getRequestDispatcher("/newPerson.jsp").forward(request, response);
                break;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
