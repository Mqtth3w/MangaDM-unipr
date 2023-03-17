import { Component } from 'react';
import calendario from '../images/calendario.png';
import indirizzo from '../images/indirizzo.png'
import datipersonali from '../images/account.png'

class Account extends Component {
 

    render(){
 
        return(

            <>
                <div className='container'>
                    <div className='row' style={{textAlign : "center"}}>
                        <h2>Il tuo account</h2><p/><p/>
                        <div className="col">
                            <button onClick={() => this.props.OnGoToOrdini(0)} className="btn btn-light" style={{"width": "13rem"}}>
                                <img src={calendario} className="card-img-top" alt="" style={{"width": "5rem"}}/>
                                <h3>I miei ordini</h3>
                            </button>
                        </div>
                        <div className="col">
                            <button onClick={() => this.props.OnGoToIndirizzi()} className="btn btn-light" style={{"width": "13rem"}}>
                                <img src={indirizzo} className="card-img-top" alt="" style={{"width": "5rem"}}/>
                                <h3>Indirizzi</h3>
                            </button>
                        </div>
                        <div className="col">
                        <button onClick={() => this.props.OnGoToDatipersonali()} className="btn btn-light" style={{"width": "13rem"}}>
                                <img src={datipersonali} className="card-img-top" alt="" style={{"width": "5rem"}}/>
                                <h3>Dati personali</h3>
                            </button>
                        </div>
                    </div>
                </div>
                
            
            </>
        );
    }
}


export default Account;