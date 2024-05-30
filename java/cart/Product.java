package cart;

public class Product {
	    private int id;
	    private String name;
	    private String description;
	    private double price;
	    private int quantity;

	    public Product(int id, String name, String description, double price, int quantity) {
	        this.id = id;
	        this.name = name;
	        this.description = description;
	        this.price = price;
	        this.quantity=quantity;
	    }
	    
	    public int getId()
	    {
	    	return id;
	    }

	    public String getName() {
	        return name;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public double getAmount() {
	        return price;
	    }

	    public int getQuantity() {
	        return quantity;
	    }
	}

