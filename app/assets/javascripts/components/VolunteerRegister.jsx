class VolunteerRegister extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      name: '',
      email: '',
      ddd_cellphone: '',
      number_cellphone: '',
      whatsapp: false,
      ddd_residential_phone: '',
      number_residential_phone: ''
    };

    this.handleInputChange = this.handleInputChange.bind(this);
  }

  handleInputChange (e) {
    e.preventDefault();

    this.setState({
      [e.target.id]: e.target.value
    });
  }

  volunteerForm () {
    return (
      <div className="form center-block">
        <div className="row">
          <div className="col-md-12">
            <div className="form-group">
              <label htmlFor="name" className="control-label">Nome</label>
              <input id="name" name="name" className="form-control" onChange={this.handleInputChange} />
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-md-6">
            <div className="form-group">
              <label htmlFor="email" className="control-label">E-mail</label>
              <input id="email" name="email" type="email" className="form-control" onChange={this.handleInputChange} />
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-md-6">
            <div className="form-group">
              <div className="row">
                <div className="col-md-9">
                  <label htmlFor="ddd_cellphone" className="control-label">Telefone celular</label>
                </div>
              </div>

              <div className="row">
                <div className="col-md-3">
                  <InputMask id="ddd_cellphone" name="ddd_cellphone" mask="99" className="form-control" onChange={this.handleInputChange} />
                </div>

                <div className="col-md-9">
                  <InputMask id="number_cellphone" name="number_cellphone" mask="999999999" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>
            </div>
          </div>

          <div className="col-md-3">
            <div className="checkbox">
              <label>
                <input id="whatsapp" type="checkbox" className="whatsapp" onChange={this.handleInputChange} /> Whatsapp <i className="fa fa-whatsapp" aria-hidden="true"></i>
              </label>
            </div>
          </div>
        </div>

        <div className="row">
          <div className="col-md-6">
            <div className="form-group">
              <div className="row">
                <div className="col-md-9">
                  <label htmlFor="ddd_residential_phone" className="control-label">Telefone residencial</label>
                </div>
              </div>

              <div className="row">
                <div className="col-md-3">
                  <InputMask id="ddd_residential_phone" name="ddd_residential_phone" mask="99" className="form-control" onChange={this.handleInputChange} />
                </div>

                <div className="col-md-9">
                  <InputMask id="number_residential_phone" name="number_residential_phone" mask="99999999" className="form-control" onChange={this.handleInputChange} />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }

  render () {
    return (
      <div>
        <div className="row bg-light-gray">
          {this.volunteerForm()}
        </div>

        <Address nextButton={this.props.nextButton}
                 saveValues={this.props.saveValues}
                 {...this.state} />
      </div>
    );
  }
}
