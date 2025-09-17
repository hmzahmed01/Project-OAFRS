package com.wipro.web;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.wipro.web.FlightDetails;

public class FlightDetailsDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/database?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "rootsql";
	private String jdbcDriver ="com.mysql.cj.jdbc.Driver";
	private static final String INSERT_USERS_SQL = "INSERT INTO flightdetails" + "  (flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity) VALUES "
			+ " (?, ?, ?, ?, ?, ?, ?);";
	
	private static final String SELECT_USER_BY_ID = "select flight_id,flight_name,source,destination,etd,seating_capacity,reservaton_type,reservaton_capacity from flightdetails where flight_id =?";
	private static final String SELECT_ALL_USERS = "select * from flightdetails";
	private static final String DELETE_USERS_SQL = "delete from flightdetails where flight_id = ?;";
	private static final String UPDATE_USERS_SQL = "update flightdetails set flight_name = ?, source= ?, destination=?, etd=?, seating_capacity=?, reservaton_type=?, reservaton_capacity=? where flight_id = ?;";
	
	public FlightDetailsDao() {
	}

	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName(jdbcDriver);
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	public void insertFlight(FlightDetails flightdetails) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, flightdetails.getFlight_name());
			preparedStatement.setString(2, flightdetails.getSource());
			preparedStatement.setString(3, flightdetails.getDestination());
			preparedStatement.setString(4, flightdetails.getEtd());
			preparedStatement.setString(5, flightdetails.getSeating_capacity());
			preparedStatement.setString(6, flightdetails.getReservaton_type());
			preparedStatement.setString(7, flightdetails.getReservaton_capacity());
			
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public FlightDetails selectFlight(int flight_id) {
		FlightDetails flightdetails = null;
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
			preparedStatement.setInt(1, flight_id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String flight_name = rs.getString("flight_name");
				String source = rs.getString("source");
				String destination = rs.getString("destination");
				String etd = rs.getString("etd");
				String seating_capacity = rs.getString("seating_capacity");
				String reservaton_type = rs.getString("reservaton_type");
				String reservaton_capacity = rs.getString("reservaton_capacity");
				flightdetails = new FlightDetails(flight_id, flight_name, source, destination, etd, seating_capacity, reservaton_type,   reservaton_capacity);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flightdetails;
	}
	
	public List<FlightDetails> selectAllFlights() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<FlightDetails> flightdetails = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int flight_id = rs.getInt("flight_id");
				String flight_name = rs.getString("flight_name");
				String source = rs.getString("source");
				String destination = rs.getString("destination");
				String etd = rs.getString("etd");
				String seating_capacity = rs.getString("seating_capacity");
				String reservaton_type = rs.getString("reservaton_type");
				String reservaton_capacity = rs.getString("reservaton_capacity");
				flightdetails.add(new FlightDetails(flight_id, flight_name, source, destination, etd, seating_capacity, reservaton_type, reservaton_capacity));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return flightdetails;
	}
	
	public boolean updateFlight(FlightDetails flightdetails) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			System.out.println("updated Flight:"+statement);
			statement.setString(1, flightdetails.getFlight_name());
			statement.setString(2, flightdetails.getSource());
			statement.setString(3, flightdetails.getDestination());
			statement.setString(4, flightdetails.getEtd());
			statement.setString(5, flightdetails.getSeating_capacity());
			statement.setString(6, flightdetails.getReservaton_type());
			statement.setString(7, flightdetails.getReservaton_capacity());
			statement.setInt(8, flightdetails.getFlight_id());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}
	
	public boolean deleteFlight(int flight_id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setInt(1, flight_id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
	
	
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}