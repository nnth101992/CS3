package thinh.codegym.controller;

import thinh.codegym.security.AppUtils;
import thinh.codegym.service.IUserService;
import thinh.codegym.service.UserForm;
import thinh.codegym.service.UserService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = "/userServlet")
public class UserServlet extends HttpServlet {
    private final IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }

        if ("update".equals(action)) {
            updateUserInfo(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String action = request.getParameter("action");

        if(action == null){
            action = "";
        }
        switch (action){
            case "update":
                showUpdateUserInfoForm(request, response);
                break;
            case "detail":
                showUserDetail(request, response);
                break;
            default:
                break;
        }
    }

    private void showUserDetail(HttpServletRequest request, HttpServletResponse response) {
        int id = AppUtils.getLoggedUser(request.getSession()).getId();
        UserForm.showForm(request, response, "view/user/accountDetail.jsp", userService, id);
    }

    private void showUpdateUserInfoForm(HttpServletRequest request, HttpServletResponse response) {
        int id = AppUtils.getLoggedUser(request.getSession()).getId();
        UserForm.showForm(request, response,"view/user/update.jsp",userService, id);
    }

    private void updateUserInfo(HttpServletRequest request, HttpServletResponse response) {
        UserForm.updateUserInfo(request, response, userService);
    }
}
