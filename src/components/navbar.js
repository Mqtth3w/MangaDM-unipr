import { Component } from 'react';
import $ from 'jquery';

import carrello from '../images/carrello.png'

class Navbar extends Component {

    render(){

        return(
            <> 
                <nav className="navbar navbar-expand-lg bg-body-tertiary" style={{backgroundColor : "#e3f2fd"}}>
                <div className="container-fluid">
                    <h3 className="navbar-brand">MangaDM</h3>
                    <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span className="navbar-toggler-icon"></span>
                    </button>
                    <div className="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul className="navbar-nav me-auto mb-2 mb-lg-0">
                        <li className="nav-item m-2">
                        <button onClick={() => this.props.OnGoToHome()}  className="btn btn-outline-primary" aria-current="page">Home</button>
                        </li>
                        <li className="nav-item m-2">
                        <button onClick={() => this.props.OnGoToAccount()} className="btn btn-outline-primary" >Account</button>
                        </li>
                        <li className="nav-item m-2">
                        <button onClick={() => this.props.OnGoToCarrello()}  className="btn btn-outline-primary">
                            Carrello
                            <img src={carrello} className="card-img-top" alt="" style={{"width": "1.3rem"}}/> 
                        </button>
                        </li>
                        <li className="nav-item m-2">
                            <button onClick={() => this.props.OnGoToOrdini(1)} className="btn btn-outline-warning" style={{visibility : (this.props.ruolo === "admin"? "visible": "hidden")}} >
                                AMMINISTRATORE
                            </button>
                        </li>
                        <li className="nav-item m-2">
                            <button onClick={() => this.props.OnLogOut()} className="btn btn-outline-secondary" style={{visibility : (this.props.Id_Utente === -1? "hidden": "visible")}} >
                                LOGOUT
                            </button>
                        </li>
                    </ul>
                    <div className="d-flex" role="search">
                        <input id="search" className="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                        <button onClick={() => this.props.OnSearch($('#search').val())} className="btn btn-outline-success">Search</button>
                    </div>
                    </div>
                </div>
                </nav>
            </>
        );
    }
}


export default Navbar;