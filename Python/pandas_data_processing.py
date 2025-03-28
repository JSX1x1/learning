import pandas as pd

# Step 1: Load Data
def load_data(file_path):
    """Loads a CSV file into a pandas DataFrame."""
    try:
        data = pd.read_csv(file_path)
        print(f"Data loaded successfully from {file_path}")
        return data
    except FileNotFoundError:
        print(f"Error: The file {file_path} was not found.")
        return None
    except Exception as e:
        print(f"An error occurred while loading the file: {e}")
        return None

# Step 2: Clean Data
def clean_data(df):
    """Performs basic data cleaning, including removing duplicates and handling missing values."""
    # Remove duplicates
    print("Removing duplicate rows...")
    df = df.drop_duplicates()

    # Handle missing values (Fill with the mean for numerical columns)
    print("Handling missing values...")
    df = df.fillna(df.mean())

    return df

# Step 3: Data Transformation
def transform_data(df):
    """Transforms the data by adding new columns or changing existing ones."""
    # Example: Add a new column that is a transformation of an existing one
    print("Transforming data...")
    if 'age' in df.columns:
        df['age_group'] = df['age'].apply(lambda x: 'Young' if x < 30 else 'Old')
    return df

# Step 4: Filter Data
def filter_data(df):
    """Filters the dataset based on certain conditions."""
    print("Filtering data...")
    # Example: Filter data to get only rows where 'age' > 25
    filtered_df = df[df['age'] > 25]
    return filtered_df

# Step 5: Grouping and Aggregating
def group_and_aggregate(df):
    """Groups data by a specific column and performs aggregation operations."""
    print("Grouping and aggregating data...")
    # Example: Group data by 'age_group' and get the average salary for each group
    grouped_df = df.groupby('age_group').agg({
        'salary': 'mean',
        'age': 'mean'
    }).reset_index()
    return grouped_df

# Step 6: Save Data
def save_data(df, output_file_path):
    """Saves the processed DataFrame to a CSV file."""
    try:
        df.to_csv(output_file_path, index=False)
        print(f"Data saved successfully to {output_file_path}")
    except Exception as e:
        print(f"An error occurred while saving the file: {e}")

# Main function
def main():
    # File paths
    input_file = 'data.csv'  # Replace with your file path
    output_file = 'processed_data.csv'  # Replace with your desired output path

    # Step 1: Load data
    df = load_data(input_file)
    if df is None:
        return
    
    # Step 2: Clean data
    df = clean_data(df)
    
    # Step 3: Transform data
    df = transform_data(df)
    
    # Step 4: Filter data
    df = filter_data(df)
    
    # Step 5: Group and aggregate data
    df_grouped = group_and_aggregate(df)
    
    # Step 6: Save processed data
    save_data(df_grouped, output_file)

# Run the script
if __name__ == '__main__':
    main()
