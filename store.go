package main

import (
	"database/sql"
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/mux"
)

var db *sql.DB
var err error

// Book struct (Model)
type Stores struct {
	ID          string `json:"id"`
	Code        string `json:"code"`
	Name        string `json:"name"`
	Address     string `json:"address"`
	Origin_host string `json:"origin_host"`
	Public_key  string `json:"public_key"`
	Notif_url   string `json:"notif_url"`
	Success_url string `json:"success_url"`
	Failed_url  string `json:"failed_url"`
	Status      string `json:"status"`
	Created_at  string `json:"created_at"`
	Created_by  string `json:"created_by"`
	Modified_at string `json:"modified_at"`
	Modified_by string `json:"modified_by"`
	Invoice_pfx string `json:"invoice_pfx"`
}

// Get all orders store

func getStore(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")

	var store []Stores

	sql := `SELECT
				id,
				IFNULL(code,''),
				IFNULL(name,'') name,
				IFNULL(address,'') address,
				IFNULL(origin_host,'') origin_host,
				IFNULL(public_key,'') public_key,
				IFNULL(notif_url,'') notif_url,
				IFNULL(success_url,'') success_url ,
				IFNULL(failed_url,'') failed_url,
				IFNULL(status,'')  status,
				IFNULL(created_at,'')  created_at,
				IFNULL(created_by,'')  created_by,
				IFNULL(modified_at,'')  modified_at,
				IFNULL(modified_by,'')  modified_by,
				IFNULL(invoice_pfx,'')  invoice_pfx
			FROM store`

	result, err := db.Query(sql)

	defer result.Close()

	if err != nil {
		panic(err.Error())
	}

	for result.Next() {

		var stores Stores
		err := result.Scan(&stores.ID, &stores.Code, &stores.Name, &stores.Address,
			&stores.Origin_host, &stores.Public_key, &stores.Notif_url, &stores.Success_url,
			&stores.Failed_url, &stores.Status, &stores.Created_at, &stores.Created_by,
			&stores.Modified_at, &stores.Modified_by, &stores.Invoice_pfx)

		if err != nil {
			panic(err.Error())
		}
		store = append(store, stores)
	}

	json.NewEncoder(w).Encode(store)
}

func createStores(w http.ResponseWriter, r *http.Request) {

	if r.Method == "POST" {

		id := r.FormValue("id")
		code := r.FormValue("code")
		name := r.FormValue("name")
		address := r.FormValue("address")
		origin_host := r.FormValue("origin_host")
		public_key := r.FormValue("public_key")
		notif_url := r.FormValue("notif_url")
		success_url := r.FormValue("success_url")
		failed_url := r.FormValue("failed_url")
		status := r.FormValue("status")
		created_at := r.FormValue("created_at")
		created_by := r.FormValue("created_by")
		modified_at := r.FormValue("modified_at")
		modified_by := r.FormValue("modified_by")
		invoice_pfx := r.FormValue("invoice_pfx")

		stmt, err := db.Prepare("INSERT INTO store (id,code,name,address,origin_host,public_key,notif_url,success_url,failed_url,status,created_at,created_by,modified_at,modified_by,invoice_pfx) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)")

		if err != nil {
			panic(err.Error())
		}

		_, err = stmt.Exec(id, code, name, address, origin_host, public_key, notif_url, success_url, failed_url, status, created_at, created_by, modified_at, modified_by, invoice_pfx)

		if err != nil {
			fmt.Fprintf(w, "Data Duplicate")
		} else {
			fmt.Fprintf(w, "Data Created")
		}

		//fmt.Fprintf(w, "Date Created")
		//http.Redirect(w, r, "/", 301)
	}
}

func getStores(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var store []Stores
	params := mux.Vars(r)

	sql := `SELECT
				id,
				IFNULL(code,''),
				IFNULL(name,'') name,
				IFNULL(address,'') address,
				IFNULL(origin_host,'') origin_host,
				IFNULL(public_key,'') public_key,
				IFNULL(notif_url,'') notif_url,
				IFNULL(success_url,'') success_url ,
				IFNULL(failed_url,'') failed_url,
				IFNULL(status,'')  status,
				IFNULL(created_at,'')  created_at,
				IFNULL(created_by,'')  created_by,
				IFNULL(modified_at,'')  modified_at,
				IFNULL(modified_by,'')  modified_by,
				IFNULL(invoice_pfx,'')  invoice_pfx
			FROM store WHERE id = ?`

	result, err := db.Query(sql, params["id"])

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var stores Stores

	for result.Next() {

		err := result.Scan(&stores.ID, &stores.Code, &stores.Name, &stores.Address,
			&stores.Origin_host, &stores.Public_key, &stores.Notif_url, &stores.Success_url,
			&stores.Failed_url, &stores.Status, &stores.Created_at, &stores.Created_by,
			&stores.Modified_at, &stores.Modified_by, &stores.Invoice_pfx)

		if err != nil {
			panic(err.Error())
		}

		store = append(store, stores)
	}

	json.NewEncoder(w).Encode(store)
}

func updateStores(w http.ResponseWriter, r *http.Request) {

	if r.Method == "PUT" {

		params := mux.Vars(r)

		newName := r.FormValue("name")

		stmt, err := db.Prepare("UPDATE store SET name = ? WHERE id = ?")

		_, err = stmt.Exec(newName, params["id"])

		if err != nil {
			panic(err.Error())
		}

		fmt.Fprintf(w, "Stores with id = %s was updated", params["id"])
	}
}

func deleteStores(w http.ResponseWriter, r *http.Request) {

	params := mux.Vars(r)
	stmt, err := db.Prepare("DELETE FROM store WHERE id = ?")

	if err != nil {
		panic(err.Error())
	}
	_, err = stmt.Exec(params["id"])

	if err != nil {
		panic(err.Error())
	}

	fmt.Fprintf(w, "Store with id = %s was deleted", params["id"])
}

func getPost(w http.ResponseWriter, r *http.Request) {

	w.Header().Set("Content-Type", "application/json")

	var store []Stores

	id := r.FormValue("id")
	name := r.FormValue("name")

	sql := `SELECT
				id,
				IFNULL(code,''),
				IFNULL(name,'') name,
				IFNULL(address,'') address,
				IFNULL(origin_host,'') origin_host,
				IFNULL(public_key,'') public_key,
				IFNULL(notif_url,'') notif_url,
				IFNULL(success_url,'') success_url ,
				IFNULL(failed_url,'') failed_url,
				IFNULL(status,'')  status,
				IFNULL(created_at,'')  created_at,
				IFNULL(created_by,'')  created_by,
				IFNULL(modified_at,'')  modified_at,
				IFNULL(modified_by,'')  modified_by,
				IFNULL(invoice_pfx,'')  invoice_pfx
			FROM store WHERE id = ? AND name = ?`

	result, err := db.Query(sql, id, name)

	if err != nil {
		panic(err.Error())
	}

	defer result.Close()

	var stores Stores

	for result.Next() {

		err := result.Scan(&stores.ID, &stores.Code, &stores.Name, &stores.Address,
			&stores.Origin_host, &stores.Public_key, &stores.Notif_url, &stores.Success_url,
			&stores.Failed_url, &stores.Status, &stores.Created_at, &stores.Created_by,
			&stores.Modified_at, &stores.Modified_by, &stores.Invoice_pfx)

		if err != nil {
			panic(err.Error())
		}

		store = append(store, stores)
	}

	json.NewEncoder(w).Encode(store)

}

// Main function
func main() {

	db, err = sql.Open("mysql", "root:@tcp(127.0.0.1:3306)/db_testing")
	if err != nil {
		panic(err.Error())
	}

	defer db.Close()

	// Init router
	r := mux.NewRouter()

	// Route handles & endpoints
	r.HandleFunc("/store", getStore).Methods("GET")
	r.HandleFunc("/store/{id}", getStores).Methods("GET")
	r.HandleFunc("/store", createStores).Methods("POST")
	r.HandleFunc("/store/{id}", updateStores).Methods("PUT")
	r.HandleFunc("/store/{id}", deleteStores).Methods("DELETE")

	//new
	r.HandleFunc("/getStores", getPost).Methods("POST")
	// Start server
	log.Fatal(http.ListenAndServe(":8080", r))
}
