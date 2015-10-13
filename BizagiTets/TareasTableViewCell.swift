
import UIKit

class TareasTableViewCell: UITableViewCell {
    @IBOutlet weak var uiLabelRequester: UILabel!
    @IBOutlet weak var uiLabelDaysRequest: UILabel!
    @IBOutlet weak var uiLabelFromTo: UILabel!
    @IBOutlet weak var uiImageViewResponse: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
