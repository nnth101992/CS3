package thinh.codegym.security;


import thinh.codegym.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class SecurityFilter implements Filter {

    public SecurityFilter() {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        String servletPath = request.getServletPath();

        User loggedUser = AppUtils.getLoggedUser(request.getSession());

        if (servletPath.equals("/login")) {
            chain.doFilter(request, response);
            return;
        }
        HttpServletRequest wrapRequest = request;

        if (loggedUser != null) {
            String userName = loggedUser.getName();
            List<String> roles = new ArrayList<>();

            if (loggedUser.getRole().equals("admin")) {
                roles.add(SecurityConfig.ROLE_USER);
                roles.add(SecurityConfig.ROLE_ADMIN);
            }
            if (loggedUser.getRole().equals("user")) {
                roles.add(SecurityConfig.ROLE_USER);
            }
            wrapRequest = new UserRoleRequestWrapper(userName, roles, request);
        }

        if (SecurityUtils.isSecurityPage(request)) {
            if (loggedUser == null) {
                String requestUri = request.getRequestURI();
                int redirectId = AppUtils.storeRedirectAfterLoginUrl(request.getSession(), requestUri);

                response.sendRedirect(wrapRequest.getContextPath() + "/loginServlet?redirectId=" + redirectId);
                return;
            }

            boolean hasPermission = SecurityUtils.hasPermission(wrapRequest);
            if (!hasPermission) {

                RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/accessDenied.jsp");

                dispatcher.forward(request, response);
                return;
            }
        }

        chain.doFilter(wrapRequest, response);
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {

    }
}
