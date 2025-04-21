from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

app = Flask(__name__)

# Configure MySQL connection
app.config['MYSQL_HOST'] = 'localhost'  # Replace with your MySQL host
app.config['MYSQL_USER'] = 'root'  # Replace with your MySQL username
app.config['MYSQL_PASSWORD'] = 'kashish'  # Replace with your MySQL password
app.config['MYSQL_DB'] = 'TravelData'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/get_route_details', methods=['POST'])
def get_route_details():
    data = request.get_json()
    start_location = data.get('start')
    end_location = data.get('end')

    if not start_location or not end_location:
        return jsonify({'error': 'Please provide both start and end locations'}), 400

    try:
        cur = mysql.connection.cursor()

        # Fetch route details
        cur.execute("""
            SELECT
                r.RouteID, r.DistanceKM,
                rp.BikeFare AS RapidoBikeFare, rp.AutoFare AS RapidoAutoFare, rp.CabFare AS RapidoCabFare,
                rt.BikeTime AS RapidoBikeTime, rt.AutoTime AS RapidoAutoTime, rt.CabTime AS RapidoCabTime,
                up.BikeFare AS UberBikeFare, up.AutoFare AS UberAutoFare, up.CabFare AS UberCabFare,
                ut.BikeTime AS UberBikeTime, ut.AutoTime AS UberAutoTime, ut.CabTime AS UberCabTime
            FROM Routes r
            LEFT JOIN RapidoPrices rp ON r.RouteID = rp.RouteID
            LEFT JOIN RapidoTimes rt ON r.RouteID = rt.RouteID
            LEFT JOIN UberPrices up ON r.RouteID = up.RouteID
            LEFT JOIN UberTimes ut ON r.RouteID = ut.RouteID
            WHERE r.StartLocation = %s AND r.EndLocation = %s
        """, (start_location, end_location))
        route = cur.fetchone()

        cur.close()

        if route:
            return jsonify(route)
        else:
            return jsonify({'message': 'No direct route found for the given locations.'}), 404

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)