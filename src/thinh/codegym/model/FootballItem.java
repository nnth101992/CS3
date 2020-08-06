package thinh.codegym.model;

public class FootballItem {
    private int id;
    private String name;
    private String category;
    private String description;
    private double price;
    private double discount;
    private String imgItem;

    public FootballItem() {
    }

    public FootballItem(int id, String name, String category, String description, double price, double discount, String imgItem) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.imgItem = imgItem;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getImgItem() {
        return imgItem;
    }

    public void setImgItem(String imgItem) {
        this.imgItem = imgItem;
    }
    public double getSellPrice() {
        return Math.floor((this.price * (100 - this.discount) /100)*10)/10;
    }
}
