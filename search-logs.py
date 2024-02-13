import os
import glob

def search_logs(keyword):
    # Stedet der loggene er lagret
    log_dir = "/path/to/log/directory"
    # Finn alle loggfilene
    log_files = glob.glob(os.path.join(log_dir, "*.log"))
    # Gå gjennom hver loggfil
    for log_file in log_files:
        with open(log_file, "r") as file:
            # Sjekk hver linje for nøkkelordet
            for line in file:
                if keyword in line:
                    print("Match found in:", log_file)
                    print(line)
                    break

if __name__ == "__main__":
    keyword = input("Enter keyword to search for: ")
    search_logs(keyword)
