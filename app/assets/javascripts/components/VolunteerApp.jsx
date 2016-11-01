class VolunteerApp extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      volunteer: {
        name: '',
        email: '',
        cellphone_attributes: {
          ddd: '',
          number: '',
          whatsapp: ''
        },
        residential_phone_attributes: {
          ddd: '',
          number: ''
        },
        address_attributes: {
          name: '',
          number: '',
          complement: '',
          neighborhood: '',
          city: '',
          state: '',
          zipcode: ''
        },
        terms_to_receive: false,
        home_distribution_attributes: {
          building_name: '',
          deliver_on_building_for_all: false,
          except_homes: false,
          number_from_homes_to_distribute: "",
          numbers_from_buildings: false
        }
      },
    }

    this.saveValues = this.saveValues.bind(this);
  }

  saveValues (field_value) {
    this.setState({
      volunteer: field_value
    });
  }

  steps () {
    var steps = [{
      title: ["Cadastrar ", <span>meu endereço</span>],
      icon: 'map-marker',
      callToActionText: ["Realize seu ", <span className="bolder">cadastro</span>, " como ", <span className="bolder">voluntário</span>],
      active: true
    },
      {
        title: ["Residências ", <span>próximas</span>],
        icon: 'object-group',
        callToActionText: ["Residências que", <br />, " quero ", <span className="bolder">distribuir</span>],
        active: false
      },
      {
        title: 'Igreja',
        icon: 'home',
        callToActionText: [<span className="bolder">Igreja</span>, " que frequenta"],
        active: false
      }]

    return steps;
  }

  render () {
    return (
      <div className="container-fluid city-which-prays">
        <Wizard steps={this.steps()}
                saveValues={this.saveValues}
                volunteer={this.state.volunteer} />
      </div>
    );
  }
}
