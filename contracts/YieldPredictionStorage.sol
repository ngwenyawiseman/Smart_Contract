// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Define the YieldPredictionStorage contract
contract YieldPredictionStorage {

    // Define a struct to represent a prediction request
    struct PredictionRequest {
        address user;               // Address of the user making the request
        string crop;                // Type of crop for which the prediction is made
        uint256 predictedYield;    // Predicted yield for the crop
        string analysisDetails;     // Details of the analysis performed
        uint256 timestamp;          // Timestamp when the request was made
    }

    // Mapping from request ID to PredictionRequest
    mapping(uint256 => PredictionRequest) public requests;

    // Function to store a new prediction request
    function storePredictionRequest(
        string memory _crop,                     // Crop type
        uint256 _predictedYield,                // Predicted yield
        string memory _analysisDetails          // Analysis details
    ) public {
        // Generate a unique request ID using the hash of various parameters
        uint256 requestId = uint256(
            keccak256(
                abi.encodePacked(
                    msg.sender,                // User address
                    _crop,                     // Crop type
                    _predictedYield,           // Predicted yield
                    _analysisDetails,          // Analysis details
                    block.timestamp            // Current timestamp
                )
            )
        );

        // Store the prediction request in the mapping with the generated request ID
        requests[requestId] = PredictionRequest(
            msg.sender,                   // User address
            _crop,                        // Crop type
            _predictedYield,              // Predicted yield
            _analysisDetails,             // Analysis details
            block.timestamp               // Current timestamp
        );
    }

    // Function to retrieve a stored prediction request by its ID
    function getPredictionRequest(uint256 _requestId) public view returns (PredictionRequest memory) {
        // Return the PredictionRequest associated with the provided request ID
        return requests[_requestId];
    }
}
