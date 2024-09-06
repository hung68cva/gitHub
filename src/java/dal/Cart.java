/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.HashMap;
import java.util.Map;
import model.Product;

/**
 *
 * @author Hung Bui
 */
public class Cart {
    private Map<Product, Integer> items = new HashMap<>();
    
    public void addProduct(Product product, int quantity) {
        if (items.containsKey(product)) {
            items.put(product, items.get(product) + quantity);
        } else {
            items.put(product, quantity);
        }
    }
    
    public Map<Product, Integer> getItems() {
        return items;
    }
    
    public void clear() {
        items.clear();
    }
    
    public double getTotal() {
        return items.entrySet().stream()
                .mapToDouble(e -> e.getKey().getPrice() * e.getValue())
                .sum();
    }
}
