class WizardIconStep extends React.Component {
  constructor (props) {
    super(props);

    this.state = {
      icon: '',
      title: '',
      id: this.props.id
    };
  }

  render () {
    var iconClassName = "fa fa-" + this.props.icon + " fa-stack-dot-7x fa-inverse";

    return (
      <div>
        <span key={this.state.id} className="fa-stack fa-2-4x">
          <i key={this.state.id} className="fa fa-circle fa-stack-2x"></i>
          <i key={this.state.id+1}className={iconClassName}></i>
        </span>

        <span key={this.state.id+1} className="step-title">{this.props.title}</span>
      </div>
    );
  }
}
