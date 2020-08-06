package thinh.codegym.controller;

import thinh.codegym.model.FootballItem;
import thinh.codegym.model.User;
import thinh.codegym.security.AppUtils;
import thinh.codegym.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FootballServlet", urlPatterns = "/footballServlet")
public class FootballServlet extends HttpServlet {

    private final IFootballItemService itemService = new FootballItemService();
    private final IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                login(request, response);
                break;
            case "signUp":
                createNewUser(request, response);
                break;
            case "create":
                createNewItem(request, response);
                break;
//            case "detail":
//                break;
            case "update":
                updateItem(request, response);
                break;
            case"remove":
                removeItem(request, response);
                break;

        }
    }

    private void removeItem(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        itemService.removeItem(id);
        try {
            response.sendRedirect("footballServlet");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void updateItem(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        FootballItem item = getInfo(request, id);
        itemService.updateItem(id, item);

        request.setAttribute("message", "Game information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/football/update.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewItem(HttpServletRequest request, HttpServletResponse response) {
        List<FootballItem> itemList = itemService.getItemList(FootballItemService.SELECT_ALL_ITEMS);

        int id = itemList.get(itemList.size() - 1).getId() + 1;
        FootballItem item = getInfo(request, id);
        itemService.newItem(item);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/football/create.jsp");
        request.setAttribute("message", "New item was added to library");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private FootballItem getInfo(HttpServletRequest request, int id) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String imgItem = request.getParameter("imgItem");
        return new FootballItem(id, name, category, description, price, discount, imgItem);
    }

    private void createNewUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userService.getUserList();

        int id = userList.get(userList.size() - 1).getId() + 1;
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/signUp.jsp");

        User user = new User(id, name, email, password, "user");
        userService.newUser(user);
        request.setAttribute("message", "Your account is ready");

        dispatcher.forward(request, response);
    }



    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nameOrEmail = request.getParameter("nameOrEmail");
        String password = request.getParameter("password");
        User userAccount = UserService.findUserExactly(nameOrEmail, password);

        if (userAccount == null) {
            String errorMessage = "Invalid username or password";

            request.setAttribute("errorMessage", errorMessage);

            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/view/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        AppUtils.storeLoggedUser(request.getSession(), userAccount);
        int redirectId = -1;

        try {
            redirectId = Integer.parseInt(request.getParameter("redirectId"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        String requestUri = AppUtils.getRedirectAfterLoginUrl(request.getSession(), redirectId);
        if (requestUri != null) {
            response.sendRedirect(requestUri);
        } else {
            response.sendRedirect(request.getContextPath() + "/footballServlet");
        }
    }




   /*---------------BOUNDARY-------------------*/





    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "login":
                showLogin(request, response);
                break;
            case "signUp":
                showSignUpDialog(request, response);
                break;
            case "create":
                showNewItemForm(request, response);
                break;
            case "detail":
                showItemDetail(request, response);
                break;
            case "update":
                showUpdateDialog(request, response);
                break;
            case "remove":
                showRemovalForm(request, response);
                break;
            case "kit":
                showKitList(request, response);
                break;
            case "shoe":
                showShoeList(request, response);
                break;
            case "ball":
                showBallList(request, response);
                break;
            case "trophy":
                showTrophyList(request, response);
                break;
            case "others":
                showOthersList(request, response);
                break;
            default:
                showItemList(request, response);
                break;
        }
    }

    private void showOthersList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_OTHERS_ITEMS);
    }

    private void showTrophyList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_TROPHY_ITEMS);
    }

    private void showBallList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_BALL_ITEMS);
    }

    private void showShoeList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_SHOE_ITEMS);
    }

    private void showKitList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_KIT_ITEMS);
    }

    private void showRemovalForm(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showForm(request, response, "view/football/remove.jsp", itemService);
    }

    private void showUpdateDialog(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showForm(request, response, "view/football/update.jsp", itemService);
    }

    private void showItemDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDispatcher dispatcher;
        FootballItem item = itemService.findItem(id);
        if (item == null) {
            dispatcher = request.getRequestDispatcher("error.jsp");
        } else {

            request.setAttribute("item", item);
            dispatcher = request.getRequestDispatcher("view/football/itemDetail.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showNewItemForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/football/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showSignUpDialog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/signUp.jsp");
        dispatcher.forward(request, response);
    }


    private void showLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/login.jsp");
        dispatcher.forward(request, response);
    }

    private void findItem(HttpServletRequest request, HttpServletResponse response) {
        String input = request.getParameter("findingItem");
        List<FootballItem> items = itemService.findItem(input);
        request.setAttribute("itemList", items);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/football/footballList.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showItemList(HttpServletRequest request, HttpServletResponse response) {
        ItemForm.showList(request, response, itemService, FootballItemService.SELECT_ALL_ITEMS);
    }
}
