// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "remix_tests.sol"; // Import Remix testing library
import "../contracts/YieldPredictionStorage.sol"; // Import the contract to be tested

contract TestYieldPredictionStorage {
    YieldPredictionStorage storageContract;

    // Setup before each test
    function beforeEach() public {
        storageContract = new YieldPredictionStorage();
    }

    function testStorePredictionRequest() public {
        // Call the function to store a prediction request
        storageContract.storePredictionRequest("Maize", 500, "Optimal conditions: Rainfall > 300mm");

        // Retrieve the stored request
        YieldPredictionStorage.PredictionRequest memory request = storageContract.getPredictionRequest(1);

        // Assert the values
        Assert.equal(request.crop, "Maize", "Crop name should match");
        Assert.equal(request.predictedYield, 500, "Predicted yield should match");
        Assert.equal(request.analysisDetails, "Optimal conditions: Rainfall > 300mm", "Analysis details should match");
    }
}
