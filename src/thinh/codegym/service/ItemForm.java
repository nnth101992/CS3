package thinh.codegym.service;

import thinh.codegym.model.FootballItem;
import thinh.codegym.model.User;
import thinh.codegym.security.AppUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ItemForm {
    public static void showForm(HttpServletRequest request, HttpServletResponse response, String path, IFootballItemService footballItemService) {
        int id = Integer.parseInt(request.getParameter("id"));
        FootballItem item = footballItemService.findItem(id);

        RequestDispatcher dispatcher;

        if (item == null) {
            dispatcher = request.getRequestDispatcher("error.jsp");
        } else {
            request.setAttribute("item", item);
            dispatcher = request.getRequestDispatcher(path);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    public static void showList(HttpServletRequest request, HttpServletResponse response, IFootballItemService footballItemService, String requestList) {
        List<FootballItem> itemList = footballItemService.getItemList(requestList);

        request.setAttribute("itemList", itemList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("view/football/footballList.jsp");

        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    public static boolean isBought(HttpServletRequest request, IFootballItemService itemService, int id) {
        User user =  AppUtils.getLoggedUser(request.getSession());
        if (user != null) {
            int userId = user.getId();
            List<Integer> itemLibrary = itemService.getLibraryItems(userId);

            for (Integer integer : itemLibrary) {
                if (id == integer) {
                    return true;
                }
            }
        }
        return false;
    }
}
