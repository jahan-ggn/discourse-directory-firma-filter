import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { hash } from "@ember/helper";
import { action } from "@ember/object";
import { service } from "@ember/service";
import ComboBox from "select-kit/components/combo-box";

export default class FirmaSelector extends Component {
  @service site;
  @service router;

  @tracked selectedFirma = null;

  get firmaOptions() {
    const userFields = this.site.get("user_fields") || [];
    const firmaField = userFields.find((field) => field.name === "Firma");
    return firmaField
      ? firmaField.options.map((option, i) => ({ id: i, name: option }))
      : [];
  }

  @action
  handleFirmaChange(selected, attrs) {
    this.router.transitionTo({ queryParams: { name: attrs?.name || "" } });
    this.selectedFirma = selected;
  }

  <template>
    <ComboBox
      @value={{this.selectedFirma}}
      @content={{this.firmaOptions}}
      @onChange={{this.handleFirmaChange}}
      class="directory-firma-selector"
      @options={{hash none="directory.firmas.all"}}
    />
  </template>
}
