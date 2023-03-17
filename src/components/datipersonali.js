import { Component } from 'react';
import show from '../images/show.png';
import hide from '../images/hide.png';

class DatiPersonali extends Component {

    psw = "password";

    handlePsw = btn =>{
        if(this.psw === "password"){
            this.psw = "text";
        }
        else{
            this.psw = "password";
        }
        const psw = this.psw;
        this.setState({psw});
    }

    render(){

        return(

            <>

                <div className='container'>
                    <div className="mb-3 row">
                        <label htmlFor="staticEmail" className="col-sm-2 col-form-label">Nome</label>
                        <div className="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value={this.props.utente.nome}  style={{"width": "15rem"}}/>
                        </div>
                    </div>
                    <div className="mb-3 row">
                        <label htmlFor="staticEmail" className="col-sm-2 col-form-label">Cognome</label>
                        <div className="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value={this.props.utente.cognome}  style={{"width": "15rem"}}/>
                        </div>
                    </div>
                    <div className="mb-3 row">
                        <label htmlFor="staticEmail" className="col-sm-2 col-form-label">Email</label>
                        <div className="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" value={this.props.utente.email}  style={{"width": "15rem"}}/>
                        </div>
                    </div>
                    <div className="mb-3 row">
                        <label htmlFor="staticEmail" className="col-sm-2 col-form-label">Password</label>
                        <div className="col-sm-10">
                            <input type={this.psw === "text"? "text": "password"}  id="psw" readonly class="form-control-plaintext" value={this.props.passwordUtente}  style={{"width": "15rem"}}/>
                            <button onClick={() => this.handlePsw()} className='btn btn-light'>
                                <img src={this.psw === "text"? hide: show} className="card-img-top" alt="" style={{"width": "1.3rem"}}/>
                            </button>
                        </div>
                    </div>
                    
                </div>
            
            </>
        );
    }
}

export default DatiPersonali;