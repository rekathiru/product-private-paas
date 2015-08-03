#!/bin/bash
# ------------------------------------------------------------------------
#
# Copyright 2005-2015 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
#
# ------------------------------------------------------------------------

# run script sets the configurable parameters for the cartridge agent in agent.conf and
# starts the cartridge agent process.

if [ "${START_CMD}" = "PCA" ]; then
    echo "Starting python cartridge agent..."
	/usr/local/bin/start-agent.sh
	echo "Python cartridge agent started successfully"
else
    echo "Configuring WSO2 ESB..."
    echo "Environment variables:"
    printenv
    pushd ${CONFIGURATOR_HOME}
    python configurator.py
    popd
    echo "WSO2 ESB configured successfully"

    echo "Starting WSO2 ESB..."
    ${CARBON_HOME}/bin/wso2server.sh
    echo "WSO2 ESB started successfully"
fi