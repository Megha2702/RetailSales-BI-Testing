import pyodbc

# Update these connection details with your SQL Server info
SERVER = 'localhost'

DATABASE = 'RetailSalesDB'
USERNAME = ''  # Leave blank if using Windows Authentication
PASSWORD = ''  # Leave blank if using Windows Authentication

# Connection string using Windows Authentication
conn_str = (
    f'DRIVER={{ODBC Driver 17 for SQL Server}};'
    f'SERVER={SERVER};'
    f'DATABASE={DATABASE};'
    'Trusted_Connection=yes;'
)

# If using SQL Server Authentication, use this connection string instead:
# conn_str = (
#     f'DRIVER={{ODBC Driver 17 for SQL Server}};'
#     f'SERVER={SERVER};'
#     f'DATABASE={DATABASE};'
#     f'UID={USERNAME};'
#     f'PWD={PASSWORD};'
# )

def run_test_queries():
    test_queries = {
        "Null QuantitySold Check": """
            SELECT COUNT(*) AS IssueCount
            FROM SalesData
            WHERE QuantitySold IS NULL;
        """,

        "Null StoreID Check": """
            SELECT COUNT(*) AS IssueCount
            FROM SalesData
            WHERE StoreID IS NULL;
        """,

        "Future SalesDate Check": """
            SELECT COUNT(*) AS IssueCount
            FROM SalesData
            WHERE SalesDate > GETDATE();
        """,

        "Negative QuantitySold Check": """
            SELECT COUNT(*) AS IssueCount
            FROM SalesData
            WHERE QuantitySold < 0;
        """,

        "TotalAmount Mismatch Check": """
            SELECT COUNT(*) AS IssueCount
            FROM SalesData
            WHERE TotalAmount <> QuantitySold * 
                (SELECT CASE ProductID 
                    WHEN 1 THEN 1000
                    WHEN 2 THEN 150
                    WHEN 3 THEN 700
                    ELSE 0
                END)
                AND QuantitySold IS NOT NULL;
        """
    }

    try:
        with pyodbc.connect(conn_str) as conn:
            cursor = conn.cursor()
            print("Starting SQL Data Quality Tests...\n")

            all_passed = True

            for test_name, query in test_queries.items():
                cursor.execute(query)
                result = cursor.fetchone()
                count = result[0] if result else 0

                if count > 0:
                    print(f"❌ Test '{test_name}' FAILED: {count} issue(s) found.")
                    all_passed = False
                else:
                    print(f"✅ Test '{test_name}' PASSED: No issues found.")

            print("\nAll tests completed.")
            if all_passed:
                print("🎉 All tests passed successfully!")
            else:
                print("⚠️ Some tests failed. Please review the issues above.")

    except pyodbc.Error as e:
        print("Error connecting to database or running queries:", e)

if __name__ == "__main__":
    run_test_queries()
