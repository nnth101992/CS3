package thinh.codegym.security;

import java.util.*;

public class SecurityConfig {

    public static final String ROLE_ADMIN = "ADMIN";
    public static final String ROLE_USER = "USER";

    private static final Map<String, List<String>> mapConfig = new HashMap<String, List<String>>();

    static {
        init();
    }

    private static void init() {
        List<String> urlPatternsUser = new ArrayList<>();

        urlPatternsUser.add("/userServlet");


        mapConfig.put(ROLE_USER, urlPatternsUser);

        List<String> urlPatternsAdmin = new ArrayList<>();

        urlPatternsAdmin.add("/userServlet");

        mapConfig.put(ROLE_ADMIN, urlPatternsAdmin);
    }

    public static Set<String> getAllAppRoles() {
        return mapConfig.keySet();
    }

    public static List<String> getUrlPatternsForRole(String role) {
        return mapConfig.get(role);
    }

}