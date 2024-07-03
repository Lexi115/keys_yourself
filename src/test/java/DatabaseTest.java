import com.sicappiello.keysyourself.core.database.Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class DatabaseTest {

    public static void queryTest() throws SQLException {
        String host = "localhost";
        String user = "root";
        String pass = "";
        String dbName = "db_tsw";

        Database db = new Database(host, user, pass, dbName);
        if (db.connect()) {
            System.out.println("Connected to database: " + db.isConnected());

            String sql = "SELECT * FROM generi WHERE id = ?";
            ResultSet rs = db.executeQuery(sql, 130);

            while (rs.next()) {
                System.out.println(rs.getString("id"));
            }

            rs.close();
        } else {
            System.out.println("Failed to connect to database" + db.isConnected());
        }

        db.close();
    }

    public static void insertTest() throws SQLException {
        String host = "localhost";
        String user = "root";
        String pass = "";
        String dbName = "db_tsw";

        Database db = new Database(host, user, pass, dbName);
        if (db.connect()) {
            System.out.println("Connected to database: " + db.isConnected());

            String sql = "INSERT INTO generi VALUES (?, ?)";
            Object[] params = {12, "testingg"};
            int s = db.executeUpdate(sql, params);

            System.out.println(s);

        } else {
            System.out.println("Failed to connect to database" + db.isConnected());
        }

        db.close();
    }


    public static void main(String[] args){
        LocalDate date = LocalDate.of(2020, 1, 25);
        System.out.println(date);
    }
}
