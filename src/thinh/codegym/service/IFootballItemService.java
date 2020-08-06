package thinh.codegym.service;

import thinh.codegym.model.FootballItem;

import java.util.List;

public interface IFootballItemService {
    List<FootballItem> getItemList(String itemRequest);

    FootballItem findItem(int id);

    List<FootballItem> findItem(String input);

    void newItem(FootballItem item);

    boolean updateItem(int id, FootballItem item);

    boolean removeItem(int id);

    void saveItemToLibrary(int userId, int itemId);

    List<Integer> getLibraryItems(int userId);
}
