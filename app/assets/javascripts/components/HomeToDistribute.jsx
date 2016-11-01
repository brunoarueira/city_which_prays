class HomeToDistribute extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      except_homes: false,
      numbers_from_buildings: false,
      number_from_homes_to_distribute: '',
      deliver_on_building_for_all: false,
      building_name: '',
      volunteer: this.props.volunteer
    };

    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleExceptHomesChange = this.handleExceptHomesChange.bind(this);
    this.handleNumbersFromBuildingsChange = this.handleNumbersFromBuildingsChange.bind(this);
    this.handleDeliverOnBuildForAllChange = this.handleDeliverOnBuildForAllChange.bind(this);
    this.nextButton = this.nextButton.bind(this);
  }

  nextButton () {
    var data = {
      home_distribution_attributes: {
        except_homes: this.state.except_homes,
        numbers_from_buildings: this.state.numbers_from_buildings,
        number_from_homes_to_distribute: this.state.number_from_homes_to_distribute,
        deliver_on_building_for_all: this.state.deliver_on_building_for_all,
        building_name: this.state.building_name
      }
    };

    return this.props.nextButton(Object.assign({}, this.state.volunteer, data));
  }

  handleInputChange (e) {
    e.preventDefault();

    this.setState({
      [e.target.id]: e.target.value
    });
  }

  handleExceptHomesChange (e) {
    e.preventDefault();

    this.setState({ except_homes: !this.state.except_homes });
  }

  handleNumbersFromBuildingsChange (e) {
    e.preventDefault();

    this.setState({ numbers_from_buildings: !this.state.numbers_from_buildings });
  }

  handleDeliverOnBuildForAllChange (e) {
    e.preventDefault();

    this.setState({ deliver_on_building_for_all: !this.state.deliver_on_building_for_all });
  }

  buildingsForm () {
    var form = '';

    if (this.state.numbers_from_buildings) {
      form = (
        <div>
          <div className="col-md-8">
            <div className="form-group form-group-lg">
              <label htmlFor="building_name" className="control-label">Nome do prédio ou condomínio</label>
              <input id="building_name" name="building_name" className="form-control" onChange={this.handleInputChange} />
            </div>
          </div>

          <div className="col-md-4">
            <div className="checkbox">
              <label>
                <input id="deliver_on_building_for_all" name="deliver_on_building_for_all" type="checkbox" onChange={this.handleDeliverOnBuildForAllChange} /> Entregar em todo o prédio/condomínio
              </label>
            </div>
          </div>

          <div className="col-md-8">
            <div className="form-group form-group-lg">
              <label htmlFor="numbers_from_apartments" className="control-label">Número dos apartamentos e blocos que serão excetuados</label>
              <input id="numbers_from_apartments" name="numbers_from_apartments"
                                                  className="form-control"
                                                  onChange={this.handleInputChange}
                                                  placeholder="Bloco A, aptos 101, 102, 103, 104"
                                                  disabled={this.state.deliver_on_building_for_all} />
            </div>
          </div>
        </div>
      );
    }

    return form;
  }

  exceptHomesForm () {
    var form = '';
    const address = this.props.volunteer.address_attributes;

    if (this.state.except_homes) {
      form = (
        <div>
          <hr className="custom-hr" />

          <div className="form center-block">
            <div className="row">
              <div className="col-md-12">
                <div className="form-group form-group-lg">
                  <label htmlFor="zipcode" className="control-label">CEP</label>
                  <input id="zipcode" name="zipcode" className="form-control" disabled="disabled" value={address.zipcode} />
                </div>
              </div>

              <div className="col-md-12">
                <div className="form-group form-group-lg">
                  <label htmlFor="address" className="control-label">Logradouro</label>
                  <input id="address_name" name="address_name" className="form-control" disabled="disabled" value={address.name} />
                </div>
              </div>

              <div className="col-md-12">
                <div className="text-center">
                  <div className="row">
                    &nbsp;
                  </div>

                  <span className="featured-1x">Digite os números das residências desta rua que você fará as distribuições</span>

                  <div className="row">
                    &nbsp;
                  </div>
                </div>

                <div className="form-group form-group-lg">
                  <input id="number_from_homes_to_distribute" name="number_from_homes_to_distribute" className="form-control" placeholder="Ex.: 546, 547, 548, de 549 à 608, etc" />
                </div>

                <div className="form-group">
                  <div className="checkbox">
                    <label>
                      <input id="numbers_from_buildings" type="checkbox" onChange={this.handleNumbersFromBuildingsChange} /> A numeração informada corresponde a um prédio ou condomínio
                    </label>
                  </div>
                </div>
              </div>

              <div className="row">
                &nbsp;
              </div>

              {this.buildingsForm()}
            </div>
          </div>
        </div>
      );
    }

    return form;
  }

  homesForm () {
    return (
      <div>
        <div className="form center-block">
          <div className="row">
            <div className="col-md-12">
              <div className="form-group featured-1x light-green">
                <div className="checkbox">
                  <label>
                    <input id="except_homes" name="except_homes" type="checkbox" onChange={this.handleExceptHomesChange} /> Além da minha residência, quero excetuar outras residências próximas à minha
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>

        {this.exceptHomesForm()}
      </div>
    );
  }

  render () {
    return (
      <div>
        <div className="row bg-light-gray">
          {this.homesForm()}
        </div>

        <div className="row">
          <div className="form center-block">
            {this.nextButton()}
          </div>
        </div>
      </div>
    );
  }
}
