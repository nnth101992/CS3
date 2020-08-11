package thinh.codegym.service;
import thinh.codegym.model.FootballItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FootballItemService implements IFootballItemService{

    private static final String ADD_NEW_ITEM = "insert into itemList (name, category, description, price, discount, imgItem) value (?,?,?,?,?,?);";
    private static final String SELECT_ITEM_BY_ID = "select * from itemList where id = ?";
    private static final String UPDATE_ITEM_INFO =  "update itemList set name = ?, category = ?, description = ?, price = ?, discount = ?, imgItem = ? where id = ?;";
    private static final String REMOVE_ITEM =  "delete from itemList where id = ?;";
    private static final String FIND_ITEM = "select * from itemList where id like ? or name like ?";
    public static final String SELECT_ALL_ITEMS = "select * from itemList";
    public static final String SELECT_KIT_ITEMS = "select * from itemList where category like 'kit'";
    public static final String SELECT_SHOE_ITEMS = "select * from itemList where category like 'shoe'";
    public static final String SELECT_BALL_ITEMS = "select * from itemList where category like 'ball'";
    public static final String SELECT_TROPHY_ITEMS = "select * from itemList where category like 'trophy'";
    public static final String SELECT_OTHERS_ITEMS = "select * from itemList where category like 'others'";
    private static final String SAVE_ITEM_TO_LIBRARY = "insert into userLibrary value (?,?);";
    private static final String GET_ITEM_LIBRARY = "select game_id from userLibrary where user_id = ?;";


    public FootballItemService() {
    }

    @Override
    public List<FootballItem> getItemList(String itemRequest) {
        List<FootballItem> itemList = new ArrayList<>();
        try (Connection connection = MySQLConnUtils.getConnection();
             PreparedStatement ps = connection.prepareStatement(itemRequest)){
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                itemList.add(getItemInfo(resultSet, id));
            }
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return itemList;
    }

    @Override
    public FootballItem findItem(int id) {
        FootballItem item = null;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ITEM_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                item = getItemInfo(resultSet, id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return item;
    }

    @Override
    public List<FootballItem> findItem(String input) {
        String findingValue = "%" + input + "%";
        List<FootballItem> itemList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(FIND_ITEM)) {
            preparedStatement.setString(1, findingValue);
            preparedStatement.setString(2, findingValue);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                itemList.add(getItemInfo(resultSet, id));
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return itemList;
    }

    @Override
    public void newItem(FootballItem item) {
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(ADD_NEW_ITEM)) {
            setItemInfo(statement, item);
            statement.executeUpdate();
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
    }

    @Override
    public boolean updateItem(int id, FootballItem item) {
        boolean itemUpdated = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_ITEM_INFO);) {
            setItemInfo(statement, item);
            statement.setInt(7, id);
            itemUpdated = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return itemUpdated;
    }

    @Override
    public boolean removeItem(int id) {
        boolean itemRemoved = false;
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(REMOVE_ITEM);) {
            statement.setInt(1, id);
            itemRemoved = statement.executeUpdate() > 0;
        } catch (SQLException exception) {
            MySQLException.printSQLException(exception);
        }
        return itemRemoved;
    }

    @Override
    public void saveItemToLibrary(int userId, int itemId) {
        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(SAVE_ITEM_TO_LIBRARY)) {
            statement.setInt(1, userId);
            statement.setInt(2, itemId);
            statement.executeUpdate();
        } catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
    }

    @Override
    public List<Integer> getLibraryItems(int userId) {
        List<Integer> itemList = new ArrayList<>();

        try (Connection connection = MySQLConnUtils.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(GET_ITEM_LIBRARY)) {
            preparedStatement.setInt(1, userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("footballItem_id");
                itemList.add(id);
            }
        }
        catch (SQLException e) {
            MySQLException.printSQLException(e);
        }
        return itemList;
    }

    private FootballItem getItemInfo (ResultSet resultSet, int id) throws SQLException {
        String name = resultSet.getString("name");
        String category = resultSet.getString("category");
        String description = resultSet.getString("description");
        double price = Double.parseDouble(resultSet.getString("price"));
        double discount = Double.parseDouble(resultSet.getString("discount"));
        String imgItem = resultSet.getString("imgItem");

        return new FootballItem(id, name, category, description, price, discount, imgItem);
    }

    private void setItemInfo (PreparedStatement ps, FootballItem item) throws SQLException {
        ps.setString(1, item.getName());
        ps.setString(2, item.getCategory());
        ps.setString(3, item.getDescription());
        ps.setDouble(4, item.getPrice());
        ps.setDouble(5, item.getDiscount());
        ps.setString(6, item.getImgItem());
    }
}
